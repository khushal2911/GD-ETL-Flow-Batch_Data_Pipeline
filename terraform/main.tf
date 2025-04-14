terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials)
  project     = var.project_id
  region      = var.region
}

# datalake
resource "google_storage_bucket" "gdelt_bucket_1" {
  name          = "${var.project_id}-gdelt-bucket"
  location      = var.location
  storage_class = var.gcs_storage_class
}

resource "google_storage_bucket" "gdelt_bucket_2" {
  name          = "kestra-storage-bucket"
  location      = var.location
  storage_class = var.gcs_storage_class
}

# Dataset schema in BigQuery
resource "google_bigquery_dataset" "newslakehouse_dataset" {
  dataset_id = var.bq_dataset_name
  location   = var.location
}