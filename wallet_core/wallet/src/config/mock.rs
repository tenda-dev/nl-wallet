use base64::{engine::general_purpose::STANDARD, Engine};
use url::Url;

use wallet_common::account::jwt::EcdsaDecodingKey;

use super::{AccountServerConfiguration, Configuration, ConfigurationRepository, LockTimeoutConfiguration};

pub struct MockConfigurationRepository(pub Configuration);

impl ConfigurationRepository for MockConfigurationRepository {
    fn config(&self) -> &Configuration {
        &self.0
    }
}

impl Default for MockConfigurationRepository {
    fn default() -> Self {
        MockConfigurationRepository(Configuration {
            lock_timeouts: LockTimeoutConfiguration {
                inactive_timeout: 60,
                background_timeout: 2 * 60,
            },
            account_server: AccountServerConfiguration {
                base_url: Url::parse("https://example.com").unwrap(),
                public_key: EcdsaDecodingKey::from_sec1(&STANDARD.decode("").unwrap()),
            },
        })
    }
}