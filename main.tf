provider "google" {
  project = "airline1-sabre-wolverine"
  access_token = var.access_token
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "us_dev_abcd_fghi_dataset1"
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = "US"
  default_table_expiration_ms = 3600000

  default_encryption_configuration {
    kms_key_name = google_kms_crypto_key.crypto_key.id
  }
}

resource "google_kms_crypto_key" "crypto_key" {
  name     = "example-key"
  key_ring = google_kms_key_ring.key_ring.id
}

resource "google_kms_key_ring" "key_ring" {
  name     = "example-keyring"
  location = "us"
}