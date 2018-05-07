resource "google_storage_bucket_object" "object" {
  name   = "${var.object_path}${var.object_file}"
  source = "${var.object_file}"
  bucket = "${google_storage_bucket.main.name}"
}
