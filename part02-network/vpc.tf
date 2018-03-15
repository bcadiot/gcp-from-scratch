# VPC specs

resource "google_compute_network" "main" {
  name = "${var.network}"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "sub" {
  count = "${length(var.subnets_regions)}"

  name          = "${var.network}-${element(var.subnets_regions, count.index)}"
  region        = "${element(var.subnets_regions, count.index)}"
  ip_cidr_range = "${cidrsubnet(var.cidr, 3, count.index)}"
  network       = "${google_compute_network.main.self_link}"
}
