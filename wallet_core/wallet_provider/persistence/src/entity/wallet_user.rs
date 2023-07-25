//! `SeaORM` Entity. Generated by sea-orm-codegen 0.11.3

use sea_orm::entity::prelude::*;

#[derive(Clone, Debug, PartialEq, DeriveEntityModel, Eq)]
#[sea_orm(table_name = "wallet_user")]
pub struct Model {
    #[sea_orm(primary_key, auto_increment = false)]
    pub id: Uuid,
    #[sea_orm(unique)]
    pub wallet_id: String,
    #[sea_orm(column_type = "Binary(BlobSize::Blob(None))")]
    pub hw_pubkey_der: Vec<u8>,
    #[sea_orm(column_type = "Binary(BlobSize::Blob(None))")]
    pub pin_pubkey_der: Vec<u8>,
    pub instruction_sequence_number: i32,
    #[sea_orm(column_type = "Binary(BlobSize::Blob(None))", nullable)]
    pub instruction_challenge: Option<Vec<u8>>,
    pub pin_entries: i16,
    pub last_unsuccessful_pin: Option<DateTimeWithTimeZone>,
    pub is_blocked: bool,
}

#[derive(Copy, Clone, Debug, EnumIter, DeriveRelation)]
pub enum Relation {}

impl ActiveModelBehavior for ActiveModel {}
