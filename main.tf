provider "google" {
  project      = var.project
  access_token = var.access_token
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = var.dataset_id
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = "US"
  default_table_expiration_ms = 3600000
  labels = {
    env                  = "default"
    application_division = "pci",
    application_name     = "demo",
    application_role     = "app",
    au                   = "0223092",
    created              = "20211122",
    data_compliance      = "pci",
    data_confidentiality = "pub",
    data_type            = "test",
    environment          = "dev",
    gcp_region           = "us",
    owner                = "hybridenv",
  }

  default_encryption_configuration {
    kms_key_name = google_kms_crypto_key.cryptokey.id
  }
}

data "google_kms_crypto_key" "cryptokey" {
  name = var.keyring_key_name
  key_ring = data.google_kms_key_ring.keyring.id
}

data "google_kms_key_ring" "keyring" {
  name     = var.keyring_name
  location = var.keyring_location
}
