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

# Storing extracted datasets from source
resource "google_storage_bucket" "gdelt_bucket" {
  name          = "${var.project_id}-gdelt-bucket"
  location      = var.location
  storage_class = var.gcs_storage_class
}

# Final processed dataset in BigQuery
resource "google_bigquery_dataset" "newslakehouse_dataset" {
  dataset_id = var.bq_dataset_name
  location   = var.location
}