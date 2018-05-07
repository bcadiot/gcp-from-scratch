variable "region" {
  description = "GCP region"
  default = "europe-west1"
}

variable "bucket_name" {
  description = "name of the bucket"
}

variable "bucket_location" {
  description = "location of the bucket"
  default = "eu"
}

variable "object_file" {
  description = "object name (must exist in relative path)"
  default = "test.conf"
}

variable "object_path" {
  description = "path where to store the object"
  default = "my-folder/"
}

variable "custom_sa" {
  description = "Email of the service account to add as viewer of the bucket"
}
