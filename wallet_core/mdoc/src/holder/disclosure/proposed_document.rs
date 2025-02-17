use indexmap::{IndexMap, IndexSet};

use crate::{
    basic_sa_ext::Entry,
    errors::Result,
    identifiers::AttributeIdentifier,
    iso::{
        disclosure::{DeviceSigned, Document, IssuerSigned},
        mdocs::DocType,
    },
    utils::{
        keys::{KeyFactory, MdocEcdsaKey},
        x509::Certificate,
    },
    NameSpace,
};

use super::StoredMdoc;

#[derive(Debug, Clone, PartialEq)]
pub struct ProposedDocumentAttributes {
    pub issuer: Certificate,
    pub attributes: IndexMap<NameSpace, Vec<Entry>>,
}

/// This type is derived from an [`Mdoc`] and will be used to construct a [`Document`]
/// for disclosure. Note that this is for internal use of [`DisclosureSession`] only.
#[derive(Debug, Clone)]
pub struct ProposedDocument<I> {
    pub source_identifier: I,
    pub private_key_id: String,
    pub doc_type: DocType,
    pub issuer_signed: IssuerSigned,
    pub device_signed_challenge: Vec<u8>,
    pub issuer_certificate: Certificate,
}

impl<I> ProposedDocument<I> {
    /// For a given set of `Mdoc`s with the same `doc_type`, return two `Vec`s:
    /// * A `Vec<ProposedDocument>` that contains all of the proposed
    ///   disclosure documents that provide all of the required attributes.
    /// * A `Vec<Vec<AttributeIdentifier>>` that contain the missing
    ///   attributes for every `Mdoc` that has at least one attribute missing.
    ///
    /// This means that the sum of the length of these `Vec`s is equal to the
    /// length of the input `Vec<Mdoc>`.
    pub fn candidates_and_missing_attributes_from_stored_mdocs(
        stored_mdocs: Vec<StoredMdoc<I>>,
        requested_attributes: &IndexSet<AttributeIdentifier>,
        device_signed_challenge: Vec<u8>,
    ) -> Result<(Vec<Self>, Vec<Vec<AttributeIdentifier>>)> {
        let mut all_missing_attributes = Vec::new();

        // Collect all `ProposedDocument`s for this `doc_type`,
        // for every `Mdoc` that satisfies the requested attributes.
        let satisfying_documents = stored_mdocs
            .into_iter()
            .filter(|stored_mdoc| {
                // Calculate missing attributes for every `Mdoc` and filter it out
                // if we find any. Also, collect the missing attributes separately.
                let available_attributes = stored_mdoc.mdoc.issuer_signed_attribute_identifiers();
                let missing_attributes = requested_attributes
                    .difference(&available_attributes)
                    .cloned()
                    .collect::<Vec<_>>();

                let is_satisfying = missing_attributes.is_empty();

                if !is_satisfying {
                    all_missing_attributes.push(missing_attributes);
                }

                is_satisfying
            })
            .collect::<Vec<_>>();
        // Convert the matching `Mdoc` to a `ProposedDocument`, based on the requested attributes.
        let document_count = satisfying_documents.len();
        let proposed_documents = satisfying_documents
            .into_iter()
            .zip(itertools::repeat_n(device_signed_challenge, document_count))
            .map(|(stored_mdoc, device_signed_challenge)| {
                ProposedDocument::try_from_stored_mdoc(stored_mdoc, requested_attributes, device_signed_challenge)
            })
            .collect::<Result<Vec<_>>>()?;

        Ok((proposed_documents, all_missing_attributes))
    }

    /// Create a [`ProposedDocument`] from a [`StoredMdoc`], containing only those
    /// attributes that are requested and a [`DeviceSigned`] challenge.
    fn try_from_stored_mdoc(
        stored_mdoc: StoredMdoc<I>,
        requested_attributes: &IndexSet<AttributeIdentifier>,
        device_signed_challenge: Vec<u8>,
    ) -> Result<Self> {
        let StoredMdoc {
            id: source_identifier,
            mdoc,
        } = stored_mdoc;

        let name_spaces = mdoc.issuer_signed.name_spaces.map(|name_spaces| {
            name_spaces
                .into_iter()
                .flat_map(|(name_space, attributes)| {
                    let attributes = attributes
                        .0
                        .into_iter()
                        .filter(|attribute| {
                            let attribute_identifier = AttributeIdentifier {
                                doc_type: mdoc.doc_type.clone(),
                                namespace: name_space.clone(),
                                attribute: attribute.0.element_identifier.clone(),
                            };

                            requested_attributes.contains(&attribute_identifier)
                        })
                        .collect::<Vec<_>>();

                    if attributes.is_empty() {
                        return None;
                    }

                    (name_space, attributes.into()).into()
                })
                .collect()
        });

        // Construct everything necessary for signing when the user approves the disclosure.
        let issuer_signed = IssuerSigned {
            name_spaces,
            issuer_auth: mdoc.issuer_signed.issuer_auth,
        };

        let issuer_certificate = issuer_signed.issuer_auth.signing_cert()?;

        let proposed_document = ProposedDocument {
            source_identifier,
            private_key_id: mdoc.private_key_id,
            doc_type: mdoc.doc_type,
            issuer_signed,
            device_signed_challenge,
            issuer_certificate,
        };
        Ok(proposed_document)
    }

    /// Return the issuer and attributes contained within this [`ProposedDocument`].
    pub fn proposed_attributes(&self) -> ProposedDocumentAttributes {
        let issuer = self.issuer_certificate.clone();
        let attributes = self
            .issuer_signed
            .name_spaces
            .as_ref()
            .map(|name_spaces| {
                name_spaces
                    .iter()
                    .map(|(name_space, attributes)| (name_space.clone(), attributes.into()))
                    .collect()
            })
            .unwrap_or_default();
        ProposedDocumentAttributes { issuer, attributes }
    }

    /// Convert multiple [`ProposedDocument`] to [`Document`] by signing the challenge using the provided `key_factory`.
    pub async fn sign_multiple<KF, K>(
        key_factory: &KF,
        proposed_documents: Vec<ProposedDocument<I>>,
    ) -> Result<Vec<Document>>
    where
        KF: KeyFactory<Key = K>,
        K: MdocEcdsaKey,
    {
        let keys_and_challenges = proposed_documents
            .iter()
            .map(|doc| {
                let public_key = doc.issuer_signed.public_key()?;
                let key: K = key_factory.generate_existing(&doc.private_key_id, public_key);
                let challenge = doc.device_signed_challenge.as_slice();
                Ok((key, challenge))
            })
            .collect::<Result<Vec<(K, &[u8])>>>()?;

        let keys_and_device_signed: Vec<(String, DeviceSigned)> =
            DeviceSigned::new_signatures(keys_and_challenges, key_factory).await?;

        let documents = proposed_documents
            .into_iter()
            .zip(keys_and_device_signed)
            .map(|(proposed_doc, (_key, device_signed))| Document {
                doc_type: proposed_doc.doc_type,
                issuer_signed: proposed_doc.issuer_signed,
                device_signed,
                errors: None,
            })
            .collect();

        Ok(documents)
    }
}

#[cfg(test)]
mod tests {
    use assert_matches::assert_matches;
    use coset::Header;
    use wallet_common::keys::{software::SoftwareEcdsaKey, ConstructibleWithIdentifier};

    use crate::{
        errors::Error,
        examples::EXAMPLE_NAMESPACE,
        holder::Mdoc,
        iso::disclosure::DeviceAuth,
        software_key_factory::SoftwareKeyFactory,
        utils::{
            cose::{self, CoseError},
            serialization::TaggedBytes,
        },
    };

    use super::{super::test::*, *};

    #[test]
    fn test_proposed_document_from_stored_mdoc() {
        let stored_mdoc = StoredMdoc {
            id: "id_1234",
            mdoc: Mdoc::new_example_mock(),
        };
        let id = stored_mdoc.id;
        let doc_type = stored_mdoc.mdoc.doc_type.clone();
        let private_key_id = stored_mdoc.mdoc.private_key_id.clone();
        let issuer_auth = stored_mdoc.mdoc.issuer_signed.issuer_auth.clone();

        let requested_attributes =
            example_identifiers_from_attributes(["driving_privileges", "family_name", "document_number"]);

        let proposed_document =
            ProposedDocument::try_from_stored_mdoc(stored_mdoc, &requested_attributes, b"foobar".to_vec()).unwrap();

        assert_eq!(proposed_document.source_identifier, id);
        assert_eq!(proposed_document.doc_type, doc_type);
        assert_eq!(proposed_document.private_key_id, private_key_id);
        assert_eq!(proposed_document.device_signed_challenge, b"foobar");

        let attributes_identifiers = proposed_document
            .issuer_signed
            .name_spaces
            .as_ref()
            .and_then(|name_spaces| name_spaces.get(EXAMPLE_NAMESPACE))
            .map(|attributes| {
                attributes
                    .0
                    .iter()
                    .map(|attribute| attribute.0.element_identifier.as_str())
                    .collect::<Vec<_>>()
            })
            .expect("Could not get expected attributes from proposed document");

        assert_eq!(
            attributes_identifiers,
            ["family_name", "document_number", "driving_privileges"]
        );
        assert_eq!(proposed_document.issuer_signed.issuer_auth, issuer_auth);
    }

    #[test]
    fn test_proposed_document_candidates_and_missing_attributes_from_mdocs() {
        let mdoc1 = Mdoc::new_example_mock();
        let mdoc2 = {
            let mut mdoc = mdoc1.clone();
            let attributes = &mut mdoc
                .issuer_signed
                .name_spaces
                .as_mut()
                .unwrap()
                .get_mut(EXAMPLE_NAMESPACE)
                .unwrap()
                .0;

            // Remove `issue_date` and `expiry_date`.
            attributes.remove(1);
            attributes.remove(1);

            mdoc
        };
        let mdoc3 = mdoc1.clone();
        let mdoc4 = {
            let mut mdoc = mdoc1.clone();
            let attributes = &mut mdoc
                .issuer_signed
                .name_spaces
                .as_mut()
                .unwrap()
                .get_mut(EXAMPLE_NAMESPACE)
                .unwrap()
                .0;

            attributes.clear();

            mdoc
        };

        let doc_type = mdoc1.doc_type.clone();
        let private_key_id = mdoc1.private_key_id.clone();

        let requested_attributes =
            example_identifiers_from_attributes(["driving_privileges", "issue_date", "expiry_date"]);

        let stored_mdocs = vec![mdoc1, mdoc2, mdoc3, mdoc4]
            .into_iter()
            .enumerate()
            .map(|(index, mdoc)| StoredMdoc {
                id: format!("id_{}", index + 1),
                mdoc,
            })
            .collect();

        let (proposed_documents, missing_attributes) =
            ProposedDocument::candidates_and_missing_attributes_from_stored_mdocs(
                stored_mdocs,
                &requested_attributes,
                b"challenge".to_vec(),
            )
            .unwrap();

        assert_eq!(proposed_documents.len(), 2);

        proposed_documents
            .into_iter()
            .zip(["id_1", "id_3"])
            .for_each(|(proposed_document, expected_identifier)| {
                assert_eq!(proposed_document.source_identifier, expected_identifier);
                assert_eq!(proposed_document.doc_type, doc_type);
                assert_eq!(proposed_document.private_key_id, private_key_id);
                assert_eq!(
                    proposed_document
                        .issuer_signed
                        .name_spaces
                        .unwrap()
                        .get(EXAMPLE_NAMESPACE)
                        .unwrap()
                        .0
                        .len(),
                    3
                );
            });

        assert_eq!(missing_attributes.len(), 2);
        assert_eq!(
            missing_attributes[0]
                .iter()
                .map(|attribute| attribute.attribute.as_str())
                .collect::<Vec<_>>(),
            ["issue_date", "expiry_date"]
        );
        assert_eq!(
            missing_attributes[1]
                .iter()
                .map(|attribute| attribute.attribute.as_str())
                .collect::<Vec<_>>(),
            ["driving_privileges", "issue_date", "expiry_date"]
        );
    }

    #[tokio::test]
    async fn test_proposed_document_sign_multiple() {
        // Create a `ProposedDocument` from the example `Mdoc`.
        let proposed_document = create_example_proposed_document();

        // Collect all of the expected values.
        let expected_doc_type = proposed_document.doc_type.clone();
        let expected_issuer_signed = proposed_document.issuer_signed.clone();

        let key = SoftwareEcdsaKey::new(&proposed_document.private_key_id);
        let expected_cose = cose::sign_cose(
            &proposed_document.device_signed_challenge,
            Header::default(),
            &key,
            false,
        )
        .await
        .unwrap();

        let mut documents = ProposedDocument::sign_multiple(&SoftwareKeyFactory::default(), vec![proposed_document])
            .await
            .expect("Could not sign ProposedDocument");

        let document = documents.remove(0);

        // Test all of the expected values, including the `DeviceSigned` COSE signature.
        assert_eq!(document.doc_type, expected_doc_type);
        assert_eq!(document.issuer_signed, expected_issuer_signed);
        assert_matches!(document.device_signed, DeviceSigned {
            name_spaces: TaggedBytes(name_spaces),
            device_auth: DeviceAuth::DeviceSignature(mdoc_cose)
        } if name_spaces.is_empty() && mdoc_cose.0 == expected_cose);
        assert!(document.errors.is_none());
    }

    #[tokio::test]
    async fn test_proposed_document_sign_error() {
        // Set up a `KeyFactory` that returns keys that fail at signing.
        let proposed_document = create_example_proposed_document();
        let key_factory = SoftwareKeyFactory {
            has_generating_error: false,
            has_key_signing_error: true,
        };

        // Conversion to `Document` should simply forward the signing error.
        let error = ProposedDocument::sign_multiple(&key_factory, vec![proposed_document])
            .await
            .expect_err("Signing ProposedDocument should have resulted in an error");

        assert_matches!(error, Error::Cose(CoseError::Signing(signing_error))
            if signing_error.to_string() == "signing error"
        );
    }
}
