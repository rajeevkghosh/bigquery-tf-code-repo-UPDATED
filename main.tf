provider "google" {
  project      = "airline1-sabre-wolverine"
  access_token = var.access_token
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "wf_us_prod_bq_app01_res01"
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = "US"
  default_table_expiration_ms = 3600000
  labels = {
    application_division = "pci",
    application_name     = "demo",
    application_role     = "app",
    au                   = "0223092",
    created              = "20211122",
    environment          = "nonprod",
    gcp_region           = "us",
    owner                = "hybridenv",
  }

  default_encryption_configuration {
    kms_key_name = data.google_kms_crypto_key.cryptokey.id
  }
}

data "google_kms_crypto_key" "cryptokey" {
  name     = "wf-us-prod-kms-app01-res0301"
  key_ring = data.google_kms_key_ring.keyring.id
}

data "google_kms_key_ring" "keyring" {
  name     = "wf-us-prod-kms-app01-res03"
  location = "us"
}
