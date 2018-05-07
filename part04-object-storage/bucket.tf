resource "google_storage_bucket" "main" {
  name     = "${var.bucket_name}"
  location = "${var.bucket_location}"

  lifecycle_rule {
    action {
      type = "SetStorageClass"
      storage_class = "NEARLINE"
    }
    condition {
      age = "30"
    }
  }

  lifecycle_rule {
    action {
      type = "SetStorageClass"
      storage_class = "COLDLINE"
    }
    condition {
      age = "90"
    }
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = "365"
    }
  }
}
