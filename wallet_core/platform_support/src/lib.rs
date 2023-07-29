pub mod hw_keystore;
pub mod utils;

#[cfg(feature = "hardware")]
mod bridge;

#[cfg(feature = "integration-test")]
pub mod integration_test;

// import generated Rust bindings
#[cfg(feature = "hardware")]
use crate::bridge::{
    hw_keystore::{EncryptionKeyBridge, KeyStoreError, SigningKeyBridge},
    init_platform_support,
    utils::{UtilitiesBridge, UtilitiesError},
};

#[cfg(feature = "hardware")]
uniffi::include_scaffolding!("platform_support");

// if the hardware feature is enabled, prefer hardware implementations
#[cfg(feature = "hardware")]
pub mod preferred {
    use crate::hw_keystore::hardware::{HardwareEcdsaKey, HardwareEncryptionKey};
    use crate::utils::hardware::HardwareUtilities;

    pub type PlatformEcdsaKey = HardwareEcdsaKey;
    pub type PlatformEncryptionKey = HardwareEncryptionKey;
    pub type PlatformUtilities = HardwareUtilities;
}

// otherwise if the software feature is enabled, prefer software fallbacks
#[cfg(all(not(feature = "hardware"), feature = "software"))]
pub mod preferred {
    use crate::utils::software::SoftwareUtilities;
    use wallet_common::account::software_keys::{SoftwareEcdsaKey, SoftwareEncryptionKey};

    pub type PlatformEcdsaKey = SoftwareEcdsaKey;
    pub type PlatformEncryptionKey = SoftwareEncryptionKey;
    pub type PlatformUtilities = SoftwareUtilities;
}

// otherwise just just alias the Never type
#[cfg(not(any(feature = "hardware", feature = "software")))]
pub mod preferred {
    use never::Never;

    pub type PlatformEcdsaKey = Never;
    pub type PlatformEncryptionKey = Never;
    pub type PlatformUtilities = Never;
}
