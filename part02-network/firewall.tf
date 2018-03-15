resource "google_compute_firewall" "http-allow-eti" {
  name    = "allow-http-external-to-internal"
  network = "${google_compute_network.main.name}"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  # tags used by our front instances
  target_tags = ["http"]
  # We allow trafic coming from any source
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "http-allow-iti" {
  name    = "allow-http-internal-to-internal"
  network = "${google_compute_network.main.name}"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  # tags used by our instances hosting microservice 1
  target_tags = ["microservice-1"]
  # We allow trafic coming from our instances hosting microservice 2
  source_tags = ["microservice-2"]
}

resource "google_compute_firewall" "mysql-deny-eti" {
  name    = "deny-mysql-internal-to-internal"
  network = "${google_compute_network.main.name}"

  # Deny acess to mysql port
  deny {
    protocol = "tcp"
    ports    = ["3306"]
  }

  # tags used by our databases instances
  target_tags = ["db"]
  # We block trafic coming from anywhere
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "mysql-allow-iti-prio" {
  name    = "allow-mysql-internal-to-internal-prio"
  network = "${google_compute_network.main.name}"

  # Allow acess to mysql port for some tags
  allow {
    protocol = "tcp"
    ports    = ["3306"]
  }

  # Increase priority (default is 1000)
  priority = "900"

  # tags used by our databases instances
  target_tags = ["db"]
  # We allow trafic coming from some tags
  source_tags = ["microservice-1", "microservice-2", "http"]
}
