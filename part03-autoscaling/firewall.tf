resource "google_compute_firewall" "http" {
  name    = "allow-http"
  network = "${data.google_compute_network.base.name}"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  target_tags = ["http"]
  source_ranges = ["0.0.0.0/0"]
}
