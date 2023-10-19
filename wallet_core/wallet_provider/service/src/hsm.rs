use std::{path::PathBuf, sync::Arc};

use async_trait::async_trait;
use cryptoki::{
    context::{CInitializeArgs, Pkcs11},
    mechanism::Mechanism,
    object::{Attribute, AttributeType, ObjectHandle},
    types::AuthPin,
};
use der::{asn1::OctetString, Decode, Encode};
use futures::future;
use p256::{
    ecdsa::{Signature, VerifyingKey},
    pkcs8::AssociatedOid,
    NistP256,
};
use r2d2_cryptoki::{Pool, SessionManager, SessionType};
use sec1::EcParameters;

use wallet_common::{spawn, utils::sha256};
use wallet_provider_domain::model::wallet_user::WalletId;

#[derive(Debug, thiserror::Error)]
pub enum HsmError {
    #[error("pkcs11 error: {0}")]
    Pkcs11(#[from] cryptoki::error::Error),

    #[error("r2d2 error: {0}")]
    R2d2(#[from] r2d2_cryptoki::r2d2::Error),

    #[error("sec1 error: {0}")]
    Sec1(#[from] sec1::der::Error),

    #[error("p256 error: {0}")]
    P256(#[from] p256::ecdsa::Error),

    #[error("no initialized slot available")]
    NoInitializedSlotAvailable,

    #[error("attribute not found: '{0}'")]
    AttributeNotFound(String),

    #[error("key not found: '{0}'")]
    KeyNotFound(String),
}

type Result<T> = std::result::Result<T, HsmError>;

pub(crate) struct PrivateKeyHandle(ObjectHandle);
pub(crate) struct PublicKeyHandle(ObjectHandle);

enum HandleType {
    Public,
    Private,
}

#[async_trait]
pub trait WalletUserHsm {
    async fn generate_key(&self, wallet_id: &WalletId, identifier: &str) -> Result<VerifyingKey>;

    async fn generate_keys(&self, wallet_id: &WalletId, identifiers: &[&str]) -> Result<Vec<(String, VerifyingKey)>> {
        future::try_join_all(identifiers.iter().map(|identifier| async move {
            let result = self.generate_key(wallet_id, identifier).await;
            result.map(|pub_key| (String::from(*identifier), pub_key))
        }))
        .await
    }

    async fn sign(&self, wallet_id: &WalletId, identifier: &str, data: Arc<Vec<u8>>) -> Result<Signature>;

    async fn sign_multiple(
        &self,
        wallet_id: &WalletId,
        identifiers: &[&str],
        data: Arc<Vec<u8>>,
    ) -> Result<Vec<(String, Signature)>> {
        future::try_join_all(identifiers.iter().map(|identifier| async {
            self.sign(wallet_id, identifier, Arc::clone(&data))
                .await
                .map(|signature| (String::from(*identifier), signature))
        }))
        .await
    }
}

#[async_trait]
pub trait Hsm {
    async fn get_verifying_key(&self, identifier: &str) -> Result<VerifyingKey>;
    async fn delete_key(&self, identifier: &str) -> Result<()>;
    async fn sign(&self, identifier: &str, data: Arc<Vec<u8>>) -> Result<Signature>;
}

#[async_trait]
pub(crate) trait Pkcs11Client {
    async fn generate_signing_key_pair(&self, identifier: &str) -> Result<(PublicKeyHandle, PrivateKeyHandle)>;
    async fn get_private_key_handle(&self, identifier: &str) -> Result<PrivateKeyHandle>;
    async fn get_public_key_handle(&self, identifier: &str) -> Result<PublicKeyHandle>;
    async fn get_verifying_key(&self, public_key_handle: PublicKeyHandle) -> Result<VerifyingKey>;
    async fn delete_key(&self, private_key_handle: PrivateKeyHandle) -> Result<()>;
    async fn sign(&self, private_key_handle: PrivateKeyHandle, data: Arc<Vec<u8>>) -> Result<Signature>;
}

#[derive(Clone)]
pub struct Pkcs11Hsm {
    pool: Pool,
}

impl Pkcs11Hsm {
    pub fn new(library_path: PathBuf, user_pin: String) -> Result<Self> {
        let pkcs11_client = Pkcs11::new(library_path)?;
        pkcs11_client.initialize(CInitializeArgs::OsThreads)?;

        let slot = *pkcs11_client
            .get_slots_with_initialized_token()?
            .first()
            .ok_or(HsmError::NoInitializedSlotAvailable)?;

        let manager = SessionManager::new(pkcs11_client, slot, SessionType::RwUser(AuthPin::new(user_pin)));

        let pool = Pool::builder().build(manager).unwrap();
        Ok(Self { pool })
    }

    fn key_identifier(prefix: &str, identifier: &str) -> String {
        format!("{prefix}_{identifier}")
    }

    async fn get_key_handle(&self, identifier: &str, handle_type: HandleType) -> Result<ObjectHandle> {
        let pool = self.pool.clone();
        let identifier = String::from(identifier);

        spawn::blocking(move || {
            let session = pool.get()?;
            let object_handles = session.find_objects(&[
                Attribute::Private(matches!(handle_type, HandleType::Private)),
                Attribute::Label(identifier.clone().into()),
            ])?;
            let object_handle = object_handles
                .first()
                .cloned()
                .ok_or(HsmError::KeyNotFound(identifier))?;
            Ok(object_handle)
        })
        .await
    }
}

#[async_trait]
impl WalletUserHsm for Pkcs11Hsm {
    async fn generate_key(&self, wallet_id: &WalletId, identifier: &str) -> Result<VerifyingKey> {
        let key_identifier = Pkcs11Hsm::key_identifier(wallet_id, identifier);
        let (public_handle, _) = self.generate_signing_key_pair(&key_identifier).await?;
        Pkcs11Client::get_verifying_key(self, public_handle).await
    }

    async fn sign(&self, wallet_id: &WalletId, identifier: &str, data: Arc<Vec<u8>>) -> Result<Signature> {
        let key_identifier = Pkcs11Hsm::key_identifier(wallet_id, identifier);
        let handle = self.get_private_key_handle(&key_identifier).await?;
        Pkcs11Client::sign(self, handle, data).await
    }
}

#[async_trait]
impl Hsm for Pkcs11Hsm {
    async fn get_verifying_key(&self, identifier: &str) -> Result<VerifyingKey> {
        let handle = self.get_public_key_handle(identifier).await?;
        Pkcs11Client::get_verifying_key(self, handle).await
    }

    async fn delete_key(&self, identifier: &str) -> Result<()> {
        let handle = self.get_private_key_handle(identifier).await?;
        Pkcs11Client::delete_key(self, handle).await?;
        Ok(())
    }

    async fn sign(&self, identifier: &str, data: Arc<Vec<u8>>) -> Result<Signature> {
        let handle = self.get_private_key_handle(identifier).await?;
        Pkcs11Client::sign(self, handle, data).await
    }
}

#[async_trait]
impl Pkcs11Client for Pkcs11Hsm {
    async fn generate_signing_key_pair(&self, identifier: &str) -> Result<(PublicKeyHandle, PrivateKeyHandle)> {
        let pool = self.pool.clone();
        let identifier = String::from(identifier);

        spawn::blocking(move || {
            let session = pool.get()?;

            let mut oid = vec![];
            EcParameters::NamedCurve(NistP256::OID).encode_to_vec(&mut oid)?;

            let pub_key_template = &[Attribute::EcParams(oid)];
            let priv_key_template = &[
                Attribute::Token(true),
                Attribute::Private(true),
                Attribute::Sensitive(true),
                Attribute::Extractable(false),
                Attribute::Derive(false),
                Attribute::Sign(true),
                Attribute::Label(identifier.into()),
            ];

            let (public_handle, private_handle) =
                session.generate_key_pair(&Mechanism::EccKeyPairGen, pub_key_template, priv_key_template)?;

            Ok((PublicKeyHandle(public_handle), PrivateKeyHandle(private_handle)))
        })
        .await
    }

    async fn get_private_key_handle(&self, identifier: &str) -> Result<PrivateKeyHandle> {
        self.get_key_handle(identifier, HandleType::Private)
            .await
            .map(PrivateKeyHandle)
    }

    async fn get_public_key_handle(&self, identifier: &str) -> Result<PublicKeyHandle> {
        self.get_key_handle(identifier, HandleType::Public)
            .await
            .map(PublicKeyHandle)
    }

    async fn get_verifying_key(&self, public_key_handle: PublicKeyHandle) -> Result<VerifyingKey> {
        let pool = self.pool.clone();

        spawn::blocking(move || {
            let session = pool.get()?;
            let attr = session
                .get_attributes(public_key_handle.0, &[AttributeType::EcPoint])?
                .first()
                .cloned()
                .ok_or(HsmError::AttributeNotFound(AttributeType::EcPoint.to_string()))?;

            match attr {
                Attribute::EcPoint(ec_point) => {
                    let octet_string = OctetString::from_der(&ec_point)?;
                    let public_key = VerifyingKey::from_sec1_bytes(octet_string.as_bytes())?;
                    Ok(public_key)
                }
                _ => Err(HsmError::AttributeNotFound(AttributeType::EcPoint.to_string())),
            }
        })
        .await
    }

    async fn delete_key(&self, private_key_handle: PrivateKeyHandle) -> Result<()> {
        let pool = self.pool.clone();

        spawn::blocking(move || {
            let session = pool.get()?;
            session.destroy_object(private_key_handle.0)?;
            Ok(())
        })
        .await
    }

    async fn sign(&self, private_key_handle: PrivateKeyHandle, data: Arc<Vec<u8>>) -> Result<Signature> {
        let pool = self.pool.clone();

        spawn::blocking(move || {
            let session = pool.get()?;
            let signature = session.sign(&Mechanism::Ecdsa, private_key_handle.0, &sha256(data.as_ref()))?;
            Ok(Signature::from_slice(&signature)?)
        })
        .await
    }
}

#[cfg(feature = "mock")]
pub mod mock {
    use std::sync::Arc;

    use async_trait::async_trait;
    use dashmap::DashMap;
    use p256::ecdsa::{signature::Signer, Signature, SigningKey, VerifyingKey};
    use rand::rngs::OsRng;
    use wallet_provider_domain::model::wallet_user::WalletId;

    use crate::hsm::{Hsm, Pkcs11Hsm, Result, WalletUserHsm};

    pub struct MockPkcs11Client(DashMap<String, SigningKey>);

    impl MockPkcs11Client {
        pub fn get_key(&self, key_prefix: &str, identifier: &str) -> Result<SigningKey> {
            let entry = self.0.get(&Pkcs11Hsm::key_identifier(key_prefix, identifier)).unwrap();
            let key = entry.value().clone();
            Ok(key)
        }
    }

    impl Default for MockPkcs11Client {
        fn default() -> Self {
            Self(DashMap::new())
        }
    }

    #[async_trait]
    impl WalletUserHsm for MockPkcs11Client {
        async fn generate_key(&self, wallet_id: &WalletId, identifier: &str) -> Result<VerifyingKey> {
            let key = SigningKey::random(&mut OsRng);
            let verifying_key = *key.verifying_key();
            self.0.insert(Pkcs11Hsm::key_identifier(wallet_id, identifier), key);
            Ok(verifying_key)
        }

        async fn sign(&self, wallet_id: &WalletId, identifier: &str, data: Arc<Vec<u8>>) -> Result<Signature> {
            Hsm::sign(self, &Pkcs11Hsm::key_identifier(wallet_id, identifier), data).await
        }
    }

    #[async_trait]
    impl Hsm for MockPkcs11Client {
        async fn get_verifying_key(&self, identifier: &str) -> Result<VerifyingKey> {
            let entry = self.0.get(identifier).unwrap();
            let key = entry.value();
            let verifying_key = key.verifying_key();
            Ok(*verifying_key)
        }

        async fn delete_key(&self, identifier: &str) -> Result<()> {
            self.0.remove(identifier).unwrap();
            Ok(())
        }

        async fn sign(&self, identifier: &str, data: Arc<Vec<u8>>) -> Result<Signature> {
            let entry = self.0.get(identifier).unwrap();
            let key = entry.value();
            let signature = Signer::sign(key, data.as_ref());
            Ok(signature)
        }
    }
}
