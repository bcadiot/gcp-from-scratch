resource "google_compute_firewall" "http" {
  name    = "allow-http"
  network = "${data.google_compute_network.base.name}"

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_tags = ["http"]
}
