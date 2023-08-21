use chrono::{DateTime, Utc};

pub mod cose;
pub mod keys;
pub mod serialization;
pub mod x509;

pub(crate) mod crypto;

#[cfg(feature = "memory_storage")]
pub mod mdocs_map;

pub trait Generator<T> {
    fn generate(&self) -> T;
}

pub struct TimeGenerator;
impl Generator<DateTime<Utc>> for TimeGenerator {
    fn generate(&self) -> DateTime<Utc> {
        Utc::now()
    }
}