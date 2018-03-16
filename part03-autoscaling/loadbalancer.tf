resource "google_compute_global_address" "default" {
  name = "gcp-from-scratch"
}

resource "google_compute_global_forwarding_rule" "default" {
  name       = "default-rule"
  target     = "${google_compute_target_http_proxy.default.self_link}"
  port_range = "80"
  ip_address = "${google_compute_global_address.default.self_link}"
}

resource "google_compute_target_http_proxy" "default" {
  name        = "gcp-from-scratch-lb"
  url_map     = "${google_compute_url_map.default.self_link}"
}

resource "google_compute_url_map" "default" {
  name            = "gcp-from-scratch-lb"
  default_service = "${google_compute_backend_service.default.self_link}"
}

resource "google_compute_backend_service" "default" {
  name        = "gcp-from-scratch-default-backend"
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 30
  enable_cdn  = false

  backend {
    group = "${element(google_compute_region_instance_group_manager.http-simple.*.instance_group, 0)}"
    balancing_mode = "RATE"
    capacity_scaler = 1.0
    max_rate_per_instance = 10
  }

  backend {
    group = "${element(google_compute_region_instance_group_manager.http-simple.*.instance_group, 1)}"
    balancing_mode = "RATE"
    capacity_scaler = 1.0
    max_rate_per_instance = 10
  }

  backend {
    group = "${element(google_compute_region_instance_group_manager.http-simple.*.instance_group, 2)}"
    balancing_mode = "RATE"
    capacity_scaler = 1.0
    max_rate_per_instance = 10
  }

  health_checks = ["${google_compute_health_check.autohealing.self_link}"]
}
