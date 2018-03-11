variable "region" {
  default = "europe-west1"
}

variable "network" {
  default = "default"
}

variable "zones" {
  default = [
      "b",
      "c",
      "d"
    ]
}

variable "instance_type" {
  default = "f1-micro"
}

variable "image" {
  default = "centos-7-v20180129"
}
