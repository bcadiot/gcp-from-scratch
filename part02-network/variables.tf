variable "region" {
  description = "Basic local region"
  default = "europe-west1"
}

variable "network" {
  description = "Custom network name"
  default = "gcp-from-scratch"
}

variable "cidr" {
  description = "Network global cidr block"
  default = "172.27.3.0/24"
}

variable "subnets_regions" {
  description = "Regions where to spread our global network"
  default = [
      "europe-west1",
      "us-west1",
      "asia-northeast1"
    ]
}
