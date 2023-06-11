terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
    }
  }
}

variable "name" {}
variable "image" {}
variable "profile" {}
variable "vpc" {}
variable "zone" {}
variable "keys" {}
variable "user_data" {}
variable "resource_group" {}
variable "tags" {}
variable "subnet_id" {}
variable "security_group" {}


resource "ibm_is_instance" "itself" {
  name           = var.name
  image          = var.image
  profile        = var.profile
  vpc            = var.vpc
  zone           = var.zone
  keys           = var.keys
  resource_group = var.resource_group
  user_data      = var.user_data

  tags = var.tags
  primary_network_interface {
    subnet          = var.subnet_id
    security_groups = var.security_group
  }
}

output "id" {
  value = ibm_is_instance.itself.id
}

output "primary_network_interface_id" {
  value = ibm_is_instance.itself.primary_network_interface[0].id
}

output "primary_network_interface_address" {
  value = ibm_is_instance.itself.primary_network_interface[0].primary_ip.0.address
}