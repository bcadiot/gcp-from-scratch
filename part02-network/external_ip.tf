# Regional static adress suitable for instances, regional load balancer, vpn endpoint
resource "google_compute_address" "example" {
  name = "example-regional-ip"
}

# Global static adress suitable for global load balancers
resource "google_compute_global_address" "example" {
  name = "example-global-ip"
}
