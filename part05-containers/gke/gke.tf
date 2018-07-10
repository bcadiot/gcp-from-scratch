resource "google_container_cluster" "gcp_from_scratch" {
  name               = "gcp-from-scratch"
  region             = "${var.region}"
  initial_node_count = 1 # Per zone

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = "03:00"
    }
  }
}
