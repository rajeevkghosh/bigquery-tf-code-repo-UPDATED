provider "google" {
  project      = "airline1-sabre-wolverine"
  access_token = var.access_token
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "dev_abcd_fghi_dataset2_bqds"
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = "asia-south1"
  default_table_expiration_ms = 3600000
  labels = {
    env = "default"
    #application_division = "pci",
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

  /*default_encryption_configuration {
    kms_key_name = google_kms_crypto_key.crypto_key5.id
  }*/
}

resource "google_kms_crypto_key" "crypto_key5" {
  name = "us-dev-abcd-fghi-cryptokey5"
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

  key_ring = data.google_kms_key_ring.key_ring.id
}

data "google_kms_key_ring" "key_ring" {
  name     = "us-dev-abcd-fghi-keyring3"
  location = "us"
}