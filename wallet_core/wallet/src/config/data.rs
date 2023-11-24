use base64::prelude::*;
use p256::{ecdsa::VerifyingKey, pkcs8::DecodePublicKey};
use url::Url;

use wallet_common::{
    config::wallet_config::{
        AccountServerConfiguration, DisclosureConfiguration, LockTimeoutConfiguration, PidIssuanceConfiguration,
        WalletConfiguration,
    },
    trust_anchor::DerTrustAnchor,
};

// Each of these values can be overridden from environment variables at compile time
// when the `env_config` feature is enabled. Additionally, environment variables can
// be added to using a file named `.env` in root directory of this crate.
const CONFIG_SERVER_BASE_URL: &str = "http://localhost:3000/config/v1";

const WALLET_PROVIDER_BASE_URL: &str = "http://localhost:3000/api/v1/";

// todo: this is now a random public_key to ensure the accountserver configuration contains legal values. Can we actually have a default for this?
const CERTIFICATE_PUBLIC_KEY: &str = "MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEW2zhAd/0VH7PzLdmAfDEmHpSWwbVRfr5H31fo2rQWtyU\
                                      oWZT/C5WSeVm5Ktp6nCwnOwhhJLLGb4K3LtUJeLKjA==";

const DIGID_CLIENT_ID: &str = "";
const DIGID_URL: &str = "https://localhost/8006/";

// todo: this is now a random public_key to ensure the accountserver configuration contains legal values. Can we actually have a default for this?
const INSTRUCTION_RESULT_PUBLIC_KEY: &str = "MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEpQqynmHM6Iey1gqLPtTi4T9PflzCDpttyk\
                                             oP/iW47jE1Ra6txPJEPq4FVQdqQJEXcJ7i8TErVQ3KNB823StXnA==";

const PID_ISSUER_URL: &str = "http://localhost:3003/";
// TODO: Remove this hardcoded CA that is necessary for tests.
const MDOC_TRUST_ANCHORS: &str = "MIIBgDCCASagAwIBAgIUA21zb+2cuU3O3IHdqIWQNWF6+fwwCgYIKoZIzj0EAwIwDzENMAsGA1UEAwwE\
                                  bXljYTAeFw0yMzA4MTAxNTEwNDBaFw0yNDA4MDkxNTEwNDBaMA8xDTALBgNVBAMMBG15Y2EwWTATBgcq\
                                  hkjOPQIBBggqhkjOPQMBBwNCAATHjlwqhDY6oe0hXL2n5jY1RjPboePKABhtItYpTwqi0MO6tTTIxdED\
                                  4IY60Qvu9DCBcW5C/jju+qMy/kFUiSuPo2AwXjAdBgNVHQ4EFgQUSjuvOcpIpcOrbq8sMjgMsk9IYyQw\
                                  HwYDVR0jBBgwFoAUSjuvOcpIpcOrbq8sMjgMsk9IYyQwDwYDVR0TAQH/BAUwAwEB/zALBgNVHQ8EBAMC\
                                  AQYwCgYIKoZIzj0EAwIDSAAwRQIgL1Gc3qKGIyiAyiL4WbeR1r22KbwoTfMk11kq6xWBpDACIQDfyPw+\
                                  qs2nh8R8WEFQzk+zJlz/4DNMXoT7M9cjFwg+Xg==";
// TODO: Remove this randomly generated CA.
const RP_TRUST_ANCHORS: &str = "MIIBlDCCATqgAwIBAgIUMmfPjx+jkrbY6twjDTCNHtnoPB4wCgYIKoZIzj0EAwIwGTEXMBUGA1UEAwwO\
                                Y2EuZXhhbXBsZS5jb20wHhcNMjMxMTA3MTA1NDEzWhcNMjQxMTA2MTA1NDEzWjAZMRcwFQYDVQQDDA5j\
                                YS5leGFtcGxlLmNvbTBZMBMGByqGSM49AgEGCCqGSM49AwEHA0IABPD39ZBr4/cNp76DturjGWRtjjqU\
                                qQgt+Xny57i2xFYHRSogzdQYQbqdUOzEfBZeW3GkBjzmbCmug2zHr5B54UKjYDBeMB0GA1UdDgQWBBR4\
                                cYdOOiKhp1xTmK4ZW8JMG4CggzAfBgNVHSMEGDAWgBR4cYdOOiKhp1xTmK4ZW8JMG4CggzAPBgNVHRMB\
                                Af8EBTADAQH/MAsGA1UdDwQEAwIBBjAKBggqhkjOPQQDAgNIADBFAiBpJ/sEsPeTm8A2XYwRmu6NOkoL\
                                NqhPN569XKLTR6rVdwIhANOMtj2LwDUG2YcLkSBPSdhh/i/iCgTeuZQpOI8y+kBw";

macro_rules! config_default {
    ($name:ident) => {
        if cfg!(feature = "env_config") {
            // If the `env_config` feature is enabled, try to get the config default from
            // the environment variable of the same name, otherwise fall back to the constant.
            option_env!(stringify!($name)).unwrap_or($name)
        } else {
            $name
        }
    };
}

#[derive(Debug, Clone)]
pub struct ConfigServerConfiguration {
    pub base_url: Url,
}

impl Default for ConfigServerConfiguration {
    fn default() -> Self {
        Self {
            base_url: Url::parse(config_default!(CONFIG_SERVER_BASE_URL)).unwrap(),
        }
    }
}

fn parse_trust_anchors(source: &str) -> Vec<DerTrustAnchor> {
    source
        .split('|')
        .map(|anchor| serde_json::from_str(format!("\"{}\"", anchor).as_str()).expect("failed to parse trust anchor"))
        .collect()
}

pub fn default_configuration() -> WalletConfiguration {
    WalletConfiguration {
        lock_timeouts: LockTimeoutConfiguration {
            inactive_timeout: 5 * 60,
            background_timeout: 5 * 60,
        },
        account_server: AccountServerConfiguration {
            base_url: Url::parse(config_default!(WALLET_PROVIDER_BASE_URL)).unwrap(),
            certificate_public_key: VerifyingKey::from_public_key_der(
                &BASE64_STANDARD.decode(config_default!(CERTIFICATE_PUBLIC_KEY)).unwrap(),
            )
            .unwrap()
            .into(),
            instruction_result_public_key: VerifyingKey::from_public_key_der(
                &BASE64_STANDARD
                    .decode(config_default!(INSTRUCTION_RESULT_PUBLIC_KEY))
                    .unwrap(),
            )
            .unwrap()
            .into(),
        },
        pid_issuance: PidIssuanceConfiguration {
            pid_issuer_url: Url::parse(config_default!(PID_ISSUER_URL)).unwrap(),
            digid_url: Url::parse(config_default!(DIGID_URL)).unwrap(),
            digid_client_id: String::from(config_default!(DIGID_CLIENT_ID)),
            digid_redirect_path: "authentication".to_string(),
        },
        disclosure: DisclosureConfiguration {
            uri_base_path: "disclosure".to_string(),
            rp_trust_anchors: parse_trust_anchors(config_default!(RP_TRUST_ANCHORS)),
        },
        mdoc_trust_anchors: parse_trust_anchors(config_default!(MDOC_TRUST_ANCHORS)),
    }
}
