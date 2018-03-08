resource "google_compute_instance" "default" {
  name         = "instance-1"
  machine_type = "${var.instance_type}"
  zone         = "${var.region}-${element(var.zones, 0)}"

  tags = ["http"]

  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }

  network_interface {
    network = "${data.google_compute_network.base.name}"
    access_config {}
  }

  metadata_startup_script = "${data.template_file.bootstrap.rendered}"

    service_account {
      scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    }
  }

  data "template_file" "bootstrap" {
    template = "${file("bootstrap.tpl")}"
  }
