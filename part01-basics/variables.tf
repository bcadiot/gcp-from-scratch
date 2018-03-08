variable "region" {
  default = "us-west1"
}

variable "network" {
  default = "default"
}

variable "zones" {
  default = [
      "a",
      "b",
      "c"
    ]
}

variable "instance_type" {
  default = "f1-micro"
}

variable "image" {
  default = "centos-7-v20180129"
}
