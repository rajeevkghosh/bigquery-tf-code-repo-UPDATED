provider "google" {
  project      = "airline1-sabre-wolverine"
  access_token = var.access_token
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "us_dev_abcd_fghi_dataset2_bqds3"
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = "US"
  default_table_expiration_ms = 3600000
  labels = {
    #env                  = "default"
    application_division = "pci",
    application_name     = "demo",
    application_role     = "app",
    au                   = "0223092",
    created              = "20211122",
    #data_compliance      = "pci",
    #data_confidentiality = "pub",
    #data_type            = "test",
    environment          = "dev",
    gcp_region           = "us",
    owner                = "hybridenv",
  }

  default_encryption_configuration {
    kms_key_name = data.google_kms_crypto_key.cryptokey.id
  }
}

data "google_kms_crypto_key" "cryptokey" {
  name     = "us-dev-abcd-fghi-cryptokey2"
  key_ring = data.google_kms_key_ring.keyring.id
}

data "google_kms_key_ring" "keyring" {
  name     = "us-dev-abcd-fghi-keyring-bq1"
  location = "us"
}
