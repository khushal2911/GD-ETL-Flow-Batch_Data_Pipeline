variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
  default = "newslakehouse"
}

variable "credentials" {
  description = "my gcp credentials"
  default     = "../keys/gcp-sa-key.json" 
}

variable "location" {
  description = "Project Location"
  default     = "EU"
}

variable "region" {
  description = "Google Cloud Region"
  type        = string
  default     = "EU-WEST2"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "newslakehouse_dataset"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}