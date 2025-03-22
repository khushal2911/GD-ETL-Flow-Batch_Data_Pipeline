variable "project_id" {
  description = "Google Cloud Project ID"
  type        = string
  default = "newslakehouse"
}

variable "region" {
  description = "Google Cloud Region"
  type        = string
  default     = "EU-WEST2"
}

variable "credentials" {
  description = "my gcp credentials"
  default     = "../keys/gcp-sa-key.json" 
}

variable "location" {
  description = "Project Location"
  #Update the below to your desired location
  default     = "EU"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  #Update the below to what you want your dataset to be called
  default     = "newslakehouse_dataset"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "REGIONAL"
}