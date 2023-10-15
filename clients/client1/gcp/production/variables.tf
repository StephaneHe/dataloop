variable "GOOGLE_APPLICATION_CREDENTIALS" {
  description = "Path to the GCP service account credentials JSON file"
  type        = string
  default     = ""
}

variable "gcp_region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "gcp_project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "dataloop-402112"
}