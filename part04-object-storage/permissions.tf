resource "google_storage_bucket_iam_member" "member" {
  bucket = "${google_storage_bucket.main.name}"
  role        = "roles/storage.objectViewer"
  member      = "serviceAccount:${var.custom_sa}"
}

resource "google_storage_object_acl" "object-acl" {
  bucket = "${google_storage_bucket.main.name}"
  object = "${google_storage_bucket_object.object.name}"

  role_entity = [
    "READER:allUsers"
  ]
}
