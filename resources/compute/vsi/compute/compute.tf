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
variable "network_interface" {}
variable "resource_instance_id" {}
variable "dns_zone_id" {}
variable "dns_domain" {}

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
    name            = var.network_interface
    subnet          = var.subnet_id
    security_groups = var.security_group
  }
}

resource "ibm_dns_resource_record" "type_a" {
  instance_id = var.resource_instance_id
  zone_id     = var.dns_zone_id
  type        = "A"
  name        = var.name
  rdata       = ibm_is_instance.itself.primary_network_interface[0].primary_ip.0.address
  ttl         = 300
}

resource "ibm_dns_resource_record" "type_ptr" {
  instance_id = var.resource_instance_id
  zone_id     = var.dns_zone_id
  type        = "PTR"
  name        = ibm_is_instance.itself.primary_network_interface[0].primary_ip.0.address
  rdata       = format("%s.%s", var.name, var.dns_domain)
  ttl         = 300
  depends_on  = [ibm_dns_resource_record.type_a]
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