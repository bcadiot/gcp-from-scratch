resource "google_compute_health_check" "autohealing" {
  name                = "autohealing-health-check"
  check_interval_sec  = 10
  timeout_sec         = 10
  healthy_threshold   = 3
  unhealthy_threshold = 3

  http_health_check {
    request_path = "/"
    port         = "80"
  }
}

# Instance group

resource "google_compute_region_instance_group_manager" "http-simple" {
  count = "${length(var.deploy_region)}"
  name = "gcp-onboard-http-simple"

  base_instance_name = "gcp-onboard-http-simple"
  instance_template  = "${google_compute_instance_template.http-simple.self_link}"
  // update_strategy    = "RESTART"
  region = "${element(var.deploy_region, count.index)}"

  // target_pools = ["${google_compute_target_pool.appserver.self_link}"]
  // target_size  = 2

  named_port {
    name = "http"
    port = 80
  }

  auto_healing_policies {
    health_check      = "${google_compute_health_check.autohealing.self_link}"
    initial_delay_sec = 300
  }
}

resource "google_compute_region_autoscaler" "http-simple" {
  count = "${length(var.deploy_region)}"
  name   = "http-simple"
  region = "${element(var.deploy_region, count.index)}"
  target = "${element(google_compute_region_instance_group_manager.http-simple.*.self_link, count.index)}"

  autoscaling_policy = {
    max_replicas    = 4
    min_replicas    = 1
    cooldown_period = 60

    load_balancing_utilization {
      target = 0.8
    }
  }
}
