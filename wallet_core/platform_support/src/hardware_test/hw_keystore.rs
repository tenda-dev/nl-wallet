use jni::{objects::JClass, JNIEnv};

use wallet_common::keys::test;

use crate::hw_keystore::hardware::{HardwareEcdsaKey, HardwareEncryptionKey};

// this is the starting point for the ECDSA key integration test performed from Android / iOS.
#[no_mangle]
fn hw_keystore_test_hardware_signature() -> bool {
    let payload = b"This is a message that will be signed.";
    let identifier = "key";

    let rt = tokio::runtime::Builder::new_current_thread()
        .enable_all()
        .build()
        .unwrap();

    rt.block_on(test::sign_and_verify_signature::<HardwareEcdsaKey>(payload, identifier))
}

#[no_mangle]
extern "C" fn Java_nl_rijksoverheid_edi_wallet_platform_1support_keystore_signing_SigningKeyBridgeInstrumentedTest_hw_1keystore_1test_1hardware_1signature(
    _env: JNIEnv,
    _: JClass,
) -> bool {
    hw_keystore_test_hardware_signature()
}

// this is the starting point for the encryption key integration test performed from Android / iOS.
#[no_mangle]
fn hw_keystore_test_hardware_encryption() -> bool {
    let payload = b"This is a message that will be encrypted.";
    let identifier = "key";

    let rt = tokio::runtime::Builder::new_current_thread()
        .enable_all()
        .build()
        .unwrap();

    rt.block_on(test::encrypt_and_decrypt_message::<HardwareEncryptionKey>(
        payload, identifier,
    ))
}

#[no_mangle]
extern "C" fn Java_nl_rijksoverheid_edi_wallet_platform_1support_keystore_encryption_EncryptionKeyBridgeInstrumentedTest_hw_1keystore_1test_1hardware_1encryption(
    _env: JNIEnv,
    _: JClass,
) -> bool {
    hw_keystore_test_hardware_encryption()
}
