#![allow(
    non_camel_case_types,
    unused,
    clippy::redundant_closure,
    clippy::useless_conversion,
    clippy::unit_arg,
    clippy::double_parens,
    non_snake_case,
    clippy::too_many_arguments
)]
// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.82.1.

use crate::api::*;
use core::panic::UnwindSafe;
use flutter_rust_bridge::rust2dart::IntoIntoDart;
use flutter_rust_bridge::*;
use std::ffi::c_void;
use std::sync::Arc;

// Section: imports

use crate::models::card::Card;
use crate::models::card::CardAttribute;
use crate::models::card::CardPersistence;
use crate::models::card::CardValue;
use crate::models::card::GenderCardValue;
use crate::models::card::LocalizedString;
use crate::models::config::FlutterConfiguration;
use crate::models::disclosure::AcceptDisclosureResult;
use crate::models::disclosure::DisclosureCard;
use crate::models::disclosure::Image;
use crate::models::disclosure::MissingAttribute;
use crate::models::disclosure::Organization;
use crate::models::disclosure::RequestPolicy;
use crate::models::disclosure::StartDisclosureResult;
use crate::models::instruction::WalletInstructionError;
use crate::models::instruction::WalletInstructionResult;
use crate::models::pin::PinValidationResult;
use crate::models::uri::IdentifyUriResult;
use crate::models::wallet_event::DisclosureStatus;
use crate::models::wallet_event::WalletEvent;

// Section: wire functions

fn wire_init_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "init",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| init(),
    )
}
fn wire_is_initialized_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, bool, _>(
        WrapInfo {
            debug_name: "is_initialized",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| Result::<_, ()>::Ok(is_initialized()),
    )
}
fn wire_is_valid_pin_impl(port_: MessagePort, pin: impl Wire2Api<String> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, PinValidationResult, _>(
        WrapInfo {
            debug_name: "is_valid_pin",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_pin = pin.wire2api();
            move |task_callback| is_valid_pin(api_pin)
        },
    )
}
fn wire_set_lock_stream_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "set_lock_stream",
            port: Some(port_),
            mode: FfiCallMode::Stream,
        },
        move || move |task_callback| Result::<_, ()>::Ok(set_lock_stream(task_callback.stream_sink::<_, bool>())),
    )
}
fn wire_clear_lock_stream_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "clear_lock_stream",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| Result::<_, ()>::Ok(clear_lock_stream()),
    )
}
fn wire_set_configuration_stream_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "set_configuration_stream",
            port: Some(port_),
            mode: FfiCallMode::Stream,
        },
        move || {
            move |task_callback| {
                Result::<_, ()>::Ok(set_configuration_stream(
                    task_callback.stream_sink::<_, FlutterConfiguration>(),
                ))
            }
        },
    )
}
fn wire_clear_configuration_stream_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "clear_configuration_stream",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| Result::<_, ()>::Ok(clear_configuration_stream()),
    )
}
fn wire_set_cards_stream_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "set_cards_stream",
            port: Some(port_),
            mode: FfiCallMode::Stream,
        },
        move || move |task_callback| set_cards_stream(task_callback.stream_sink::<_, Vec<Card>>()),
    )
}
fn wire_clear_cards_stream_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "clear_cards_stream",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| Result::<_, ()>::Ok(clear_cards_stream()),
    )
}
fn wire_set_recent_history_stream_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "set_recent_history_stream",
            port: Some(port_),
            mode: FfiCallMode::Stream,
        },
        move || move |task_callback| set_recent_history_stream(task_callback.stream_sink::<_, Vec<WalletEvent>>()),
    )
}
fn wire_clear_recent_history_stream_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "clear_recent_history_stream",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| Result::<_, ()>::Ok(clear_recent_history_stream()),
    )
}
fn wire_unlock_wallet_impl(port_: MessagePort, pin: impl Wire2Api<String> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, WalletInstructionResult, _>(
        WrapInfo {
            debug_name: "unlock_wallet",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_pin = pin.wire2api();
            move |task_callback| unlock_wallet(api_pin)
        },
    )
}
fn wire_lock_wallet_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "lock_wallet",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| Result::<_, ()>::Ok(lock_wallet()),
    )
}
fn wire_has_registration_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, bool, _>(
        WrapInfo {
            debug_name: "has_registration",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| Result::<_, ()>::Ok(has_registration()),
    )
}
fn wire_register_impl(port_: MessagePort, pin: impl Wire2Api<String> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "register",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_pin = pin.wire2api();
            move |task_callback| register(api_pin)
        },
    )
}
fn wire_identify_uri_impl(port_: MessagePort, uri: impl Wire2Api<String> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, IdentifyUriResult, _>(
        WrapInfo {
            debug_name: "identify_uri",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_uri = uri.wire2api();
            move |task_callback| identify_uri(api_uri)
        },
    )
}
fn wire_create_pid_issuance_redirect_uri_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, String, _>(
        WrapInfo {
            debug_name: "create_pid_issuance_redirect_uri",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| create_pid_issuance_redirect_uri(),
    )
}
fn wire_cancel_pid_issuance_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "cancel_pid_issuance",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| cancel_pid_issuance(),
    )
}
fn wire_continue_pid_issuance_impl(port_: MessagePort, uri: impl Wire2Api<String> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, Vec<Card>, _>(
        WrapInfo {
            debug_name: "continue_pid_issuance",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_uri = uri.wire2api();
            move |task_callback| continue_pid_issuance(api_uri)
        },
    )
}
fn wire_accept_pid_issuance_impl(port_: MessagePort, pin: impl Wire2Api<String> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, WalletInstructionResult, _>(
        WrapInfo {
            debug_name: "accept_pid_issuance",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_pin = pin.wire2api();
            move |task_callback| accept_pid_issuance(api_pin)
        },
    )
}
fn wire_reject_pid_issuance_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "reject_pid_issuance",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| reject_pid_issuance(),
    )
}
fn wire_start_disclosure_impl(port_: MessagePort, uri: impl Wire2Api<String> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, StartDisclosureResult, _>(
        WrapInfo {
            debug_name: "start_disclosure",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_uri = uri.wire2api();
            move |task_callback| start_disclosure(api_uri)
        },
    )
}
fn wire_cancel_disclosure_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "cancel_disclosure",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| cancel_disclosure(),
    )
}
fn wire_accept_disclosure_impl(port_: MessagePort, pin: impl Wire2Api<String> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, AcceptDisclosureResult, _>(
        WrapInfo {
            debug_name: "accept_disclosure",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_pin = pin.wire2api();
            move |task_callback| accept_disclosure(api_pin)
        },
    )
}
fn wire_get_history_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, Vec<WalletEvent>, _>(
        WrapInfo {
            debug_name: "get_history",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| get_history(),
    )
}
fn wire_get_history_for_card_impl(port_: MessagePort, doc_type: impl Wire2Api<String> + UnwindSafe) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, Vec<WalletEvent>, _>(
        WrapInfo {
            debug_name: "get_history_for_card",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || {
            let api_doc_type = doc_type.wire2api();
            move |task_callback| get_history_for_card(api_doc_type)
        },
    )
}
fn wire_reset_wallet_impl(port_: MessagePort) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap::<_, _, _, (), _>(
        WrapInfo {
            debug_name: "reset_wallet",
            port: Some(port_),
            mode: FfiCallMode::Normal,
        },
        move || move |task_callback| Result::<_, ()>::Ok(reset_wallet()),
    )
}
// Section: wrapper structs

// Section: static checks

// Section: allocate functions

// Section: related functions

// Section: impl Wire2Api

pub trait Wire2Api<T> {
    fn wire2api(self) -> T;
}

impl<T, S> Wire2Api<Option<T>> for *mut S
where
    *mut S: Wire2Api<T>,
{
    fn wire2api(self) -> Option<T> {
        (!self.is_null()).then(|| self.wire2api())
    }
}

impl Wire2Api<u8> for u8 {
    fn wire2api(self) -> u8 {
        self
    }
}

// Section: impl IntoDart

impl support::IntoDart for AcceptDisclosureResult {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::Ok { return_url } => vec![0.into_dart(), return_url.into_dart()],
            Self::InstructionError { error } => vec![1.into_dart(), error.into_into_dart().into_dart()],
        }
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for AcceptDisclosureResult {}
impl rust2dart::IntoIntoDart<AcceptDisclosureResult> for AcceptDisclosureResult {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for Card {
    fn into_dart(self) -> support::DartAbi {
        vec![
            self.issuer.into_into_dart().into_dart(),
            self.persistence.into_into_dart().into_dart(),
            self.doc_type.into_into_dart().into_dart(),
            self.attributes.into_into_dart().into_dart(),
        ]
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for Card {}
impl rust2dart::IntoIntoDart<Card> for Card {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for CardAttribute {
    fn into_dart(self) -> support::DartAbi {
        vec![
            self.key.into_into_dart().into_dart(),
            self.labels.into_into_dart().into_dart(),
            self.value.into_into_dart().into_dart(),
        ]
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for CardAttribute {}
impl rust2dart::IntoIntoDart<CardAttribute> for CardAttribute {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for CardPersistence {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::InMemory => vec![0.into_dart()],
            Self::Stored { id } => vec![1.into_dart(), id.into_into_dart().into_dart()],
        }
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for CardPersistence {}
impl rust2dart::IntoIntoDart<CardPersistence> for CardPersistence {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for CardValue {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::String { value } => vec![0.into_dart(), value.into_into_dart().into_dart()],
            Self::Boolean { value } => vec![1.into_dart(), value.into_into_dart().into_dart()],
            Self::Date { value } => vec![2.into_dart(), value.into_into_dart().into_dart()],
            Self::Gender { value } => vec![3.into_dart(), value.into_into_dart().into_dart()],
        }
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for CardValue {}
impl rust2dart::IntoIntoDart<CardValue> for CardValue {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for DisclosureCard {
    fn into_dart(self) -> support::DartAbi {
        vec![
            self.issuer.into_into_dart().into_dart(),
            self.doc_type.into_into_dart().into_dart(),
            self.attributes.into_into_dart().into_dart(),
        ]
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for DisclosureCard {}
impl rust2dart::IntoIntoDart<DisclosureCard> for DisclosureCard {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for DisclosureStatus {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::Success => 0,
            Self::Cancelled => 1,
            Self::Error => 2,
        }
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for DisclosureStatus {}
impl rust2dart::IntoIntoDart<DisclosureStatus> for DisclosureStatus {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for FlutterConfiguration {
    fn into_dart(self) -> support::DartAbi {
        vec![
            self.inactive_lock_timeout.into_into_dart().into_dart(),
            self.background_lock_timeout.into_into_dart().into_dart(),
            self.version.into_into_dart().into_dart(),
        ]
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for FlutterConfiguration {}
impl rust2dart::IntoIntoDart<FlutterConfiguration> for FlutterConfiguration {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for GenderCardValue {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::Unknown => 0,
            Self::Male => 1,
            Self::Female => 2,
            Self::NotApplicable => 3,
        }
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for GenderCardValue {}
impl rust2dart::IntoIntoDart<GenderCardValue> for GenderCardValue {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for IdentifyUriResult {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::PidIssuance => 0,
            Self::Disclosure => 1,
        }
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for IdentifyUriResult {}
impl rust2dart::IntoIntoDart<IdentifyUriResult> for IdentifyUriResult {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for Image {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::Svg { xml } => vec![0.into_dart(), xml.into_into_dart().into_dart()],
            Self::Png { base64 } => vec![1.into_dart(), base64.into_into_dart().into_dart()],
            Self::Jpg { base64 } => vec![2.into_dart(), base64.into_into_dart().into_dart()],
            Self::Asset { path } => vec![3.into_dart(), path.into_into_dart().into_dart()],
        }
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for Image {}
impl rust2dart::IntoIntoDart<Image> for Image {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for LocalizedString {
    fn into_dart(self) -> support::DartAbi {
        vec![
            self.language.into_into_dart().into_dart(),
            self.value.into_into_dart().into_dart(),
        ]
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for LocalizedString {}
impl rust2dart::IntoIntoDart<LocalizedString> for LocalizedString {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for MissingAttribute {
    fn into_dart(self) -> support::DartAbi {
        vec![self.labels.into_into_dart().into_dart()].into_dart()
    }
}
impl support::IntoDartExceptPrimitive for MissingAttribute {}
impl rust2dart::IntoIntoDart<MissingAttribute> for MissingAttribute {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for Organization {
    fn into_dart(self) -> support::DartAbi {
        vec![
            self.legal_name.into_into_dart().into_dart(),
            self.display_name.into_into_dart().into_dart(),
            self.description.into_into_dart().into_dart(),
            self.image.into_dart(),
            self.web_url.into_dart(),
            self.privacy_policy_url.into_dart(),
            self.kvk.into_dart(),
            self.city.into_dart(),
            self.category.into_into_dart().into_dart(),
            self.department.into_dart(),
            self.country_code.into_dart(),
        ]
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for Organization {}
impl rust2dart::IntoIntoDart<Organization> for Organization {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for PinValidationResult {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::Ok => 0,
            Self::TooFewUniqueDigits => 1,
            Self::SequentialDigits => 2,
            Self::OtherIssue => 3,
        }
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for PinValidationResult {}
impl rust2dart::IntoIntoDart<PinValidationResult> for PinValidationResult {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for RequestPolicy {
    fn into_dart(self) -> support::DartAbi {
        vec![
            self.data_storage_duration_in_minutes.into_dart(),
            self.data_shared_with_third_parties.into_into_dart().into_dart(),
            self.data_deletion_possible.into_into_dart().into_dart(),
            self.policy_url.into_into_dart().into_dart(),
        ]
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for RequestPolicy {}
impl rust2dart::IntoIntoDart<RequestPolicy> for RequestPolicy {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for StartDisclosureResult {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::Request {
                relying_party,
                policy,
                requested_cards,
                shared_data_with_relying_party_before,
                request_purpose,
                request_origin_base_url,
            } => vec![
                0.into_dart(),
                relying_party.into_into_dart().into_dart(),
                policy.into_into_dart().into_dart(),
                requested_cards.into_into_dart().into_dart(),
                shared_data_with_relying_party_before.into_into_dart().into_dart(),
                request_purpose.into_into_dart().into_dart(),
                request_origin_base_url.into_into_dart().into_dart(),
            ],
            Self::RequestAttributesMissing {
                relying_party,
                missing_attributes,
                shared_data_with_relying_party_before,
                request_purpose,
                request_origin_base_url,
            } => vec![
                1.into_dart(),
                relying_party.into_into_dart().into_dart(),
                missing_attributes.into_into_dart().into_dart(),
                shared_data_with_relying_party_before.into_into_dart().into_dart(),
                request_purpose.into_into_dart().into_dart(),
                request_origin_base_url.into_into_dart().into_dart(),
            ],
        }
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for StartDisclosureResult {}
impl rust2dart::IntoIntoDart<StartDisclosureResult> for StartDisclosureResult {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for WalletEvent {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::Disclosure {
                date_time,
                relying_party,
                purpose,
                requested_cards,
                request_policy,
                status,
            } => vec![
                0.into_dart(),
                date_time.into_into_dart().into_dart(),
                relying_party.into_into_dart().into_dart(),
                purpose.into_into_dart().into_dart(),
                requested_cards.into_dart(),
                request_policy.into_into_dart().into_dart(),
                status.into_into_dart().into_dart(),
            ],
            Self::Issuance { date_time, card } => vec![
                1.into_dart(),
                date_time.into_into_dart().into_dart(),
                card.into_into_dart().into_dart(),
            ],
        }
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for WalletEvent {}
impl rust2dart::IntoIntoDart<WalletEvent> for WalletEvent {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for WalletInstructionError {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::IncorrectPin {
                leftover_attempts,
                is_final_attempt,
            } => vec![
                0.into_dart(),
                leftover_attempts.into_into_dart().into_dart(),
                is_final_attempt.into_into_dart().into_dart(),
            ],
            Self::Timeout { timeout_millis } => vec![1.into_dart(), timeout_millis.into_into_dart().into_dart()],
            Self::Blocked => vec![2.into_dart()],
        }
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for WalletInstructionError {}
impl rust2dart::IntoIntoDart<WalletInstructionError> for WalletInstructionError {
    fn into_into_dart(self) -> Self {
        self
    }
}

impl support::IntoDart for WalletInstructionResult {
    fn into_dart(self) -> support::DartAbi {
        match self {
            Self::Ok => vec![0.into_dart()],
            Self::InstructionError { error } => vec![1.into_dart(), error.into_into_dart().into_dart()],
        }
        .into_dart()
    }
}
impl support::IntoDartExceptPrimitive for WalletInstructionResult {}
impl rust2dart::IntoIntoDart<WalletInstructionResult> for WalletInstructionResult {
    fn into_into_dart(self) -> Self {
        self
    }
}

// Section: executor

support::lazy_static! {
    pub static ref FLUTTER_RUST_BRIDGE_HANDLER: support::DefaultHandler = Default::default();
}

#[cfg(not(target_family = "wasm"))]
#[path = "bridge.io.rs"]
mod io;
#[cfg(not(target_family = "wasm"))]
pub use io::*;
