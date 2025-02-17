use std::{collections::HashMap, iter};

use p256::ecdsa::{signature, signature::Verifier, Signature, VerifyingKey};

use nl_wallet_mdoc::utils::keys::{KeyFactory, MdocEcdsaKey, MdocKeyType};
use platform_support::hw_keystore::PlatformEcdsaKey;
use wallet_common::{
    account::messages::instructions::{GenerateKey, GenerateKeyResult, Sign},
    keys::{EcdsaKey, SecureEcdsaKey, WithIdentifier},
    utils::random_string,
};

use crate::{account_provider::AccountProviderClient, storage::Storage};

use super::{InstructionClient, InstructionError};

#[derive(Debug, thiserror::Error)]
pub enum RemoteEcdsaKeyError {
    #[error("error sending instruction to Wallet Provider: {0}")]
    Instruction(#[from] InstructionError),
    #[error("invalid signature received from Wallet Provider: {0}")]
    Signature(#[from] signature::Error),
    #[error("key '{0}' not found in Wallet Provider")]
    KeyNotFound(String),
}

pub struct RemoteEcdsaKeyFactory<'a, S, K, A> {
    instruction_client: &'a InstructionClient<'a, S, K, A>,
}

pub struct RemoteEcdsaKey<'a, S, K, A> {
    identifier: String,
    public_key: VerifyingKey,
    key_factory: &'a RemoteEcdsaKeyFactory<'a, S, K, A>,
}

impl<'a, S, K, A> RemoteEcdsaKeyFactory<'a, S, K, A> {
    pub fn new(instruction_client: &'a InstructionClient<'a, S, K, A>) -> Self {
        Self { instruction_client }
    }
}

impl<'a, S, K, A> KeyFactory for &'a RemoteEcdsaKeyFactory<'a, S, K, A>
where
    S: Storage,
    K: PlatformEcdsaKey,
    A: AccountProviderClient,
{
    type Key = RemoteEcdsaKey<'a, S, K, A>;
    type Error = RemoteEcdsaKeyError;

    async fn generate_new_multiple(&self, count: u64) -> Result<Vec<Self::Key>, Self::Error> {
        let identifiers = iter::repeat_with(|| random_string(32)).take(count as usize).collect();
        let result: GenerateKeyResult = self.instruction_client.send(GenerateKey { identifiers }).await?;

        let keys = result
            .public_keys
            .into_iter()
            .map(|(identifier, public_key)| RemoteEcdsaKey {
                identifier,
                public_key: public_key.0,
                key_factory: self,
            })
            .collect();

        Ok(keys)
    }

    fn generate_existing<I: Into<String>>(&self, identifier: I, public_key: VerifyingKey) -> Self::Key {
        RemoteEcdsaKey {
            identifier: identifier.into(),
            public_key,
            key_factory: self,
        }
    }

    async fn sign_with_new_keys(
        &self,
        msg: Vec<u8>,
        number_of_keys: u64,
    ) -> Result<Vec<(Self::Key, Signature)>, Self::Error> {
        let keys = self.generate_new_multiple(number_of_keys).await?;
        self.sign_with_existing_keys(vec![(msg, keys)]).await
    }

    async fn sign_with_existing_keys(
        &self,
        messages_and_keys: Vec<(Vec<u8>, Vec<Self::Key>)>,
    ) -> Result<Vec<(Self::Key, Signature)>, Self::Error> {
        let (messages, keys): (Vec<_>, Vec<Vec<_>>) = messages_and_keys.into_iter().unzip();

        let identifiers = keys
            .iter()
            .map(|keys| keys.iter().map(|key| key.identifier.clone()).collect::<Vec<String>>())
            .collect::<Vec<_>>();

        let result = self
            .instruction_client
            .send(Sign {
                messages_with_identifiers: messages.into_iter().zip(identifiers).collect(),
            })
            .await?;

        let mut keys_by_identifier: HashMap<String, Self::Key> = keys
            .into_iter()
            .flat_map(|keys| {
                keys.into_iter()
                    .map(|key| (key.identifier.clone(), key))
                    .collect::<Vec<_>>()
            })
            .collect();

        let keys_and_signatures = result
            .signatures_by_identifier
            .into_iter()
            .map(|(key, value)| (keys_by_identifier.remove(&key).unwrap(), value.0))
            .collect();

        Ok(keys_and_signatures)
    }
}

impl<S, K, A> WithIdentifier for RemoteEcdsaKey<'_, S, K, A> {
    fn identifier(&self) -> &str {
        &self.identifier
    }
}

impl<S, K, A> EcdsaKey for RemoteEcdsaKey<'_, S, K, A>
where
    S: Storage,
    K: PlatformEcdsaKey,
    A: AccountProviderClient,
{
    type Error = RemoteEcdsaKeyError;

    async fn verifying_key(&self) -> Result<VerifyingKey, Self::Error> {
        Ok(self.public_key)
    }

    async fn try_sign(&self, msg: &[u8]) -> Result<Signature, Self::Error> {
        let result = self
            .key_factory
            .instruction_client
            .send(Sign {
                messages_with_identifiers: vec![(msg.to_vec(), vec![self.identifier.clone()])],
            })
            .await?;

        let signature = result
            .signatures_by_identifier
            .get(&self.identifier)
            .ok_or(RemoteEcdsaKeyError::KeyNotFound(self.identifier.clone()))?;

        self.public_key.verify(msg, &signature.0)?;

        Ok(signature.0)
    }
}

impl<S, K, A> SecureEcdsaKey for RemoteEcdsaKey<'_, S, K, A>
where
    S: Storage,
    K: PlatformEcdsaKey,
    A: AccountProviderClient,
{
}

impl<S, K, A> MdocEcdsaKey for RemoteEcdsaKey<'_, S, K, A>
where
    S: Storage,
    K: PlatformEcdsaKey,
    A: AccountProviderClient,
{
    const KEY_TYPE: MdocKeyType = MdocKeyType::Remote;
}
