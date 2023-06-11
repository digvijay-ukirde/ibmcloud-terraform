terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
    }
  }
}

variable "name" {}
variable "target_network_id" {}
variable "resource_group" {}
variable "tags" {}


resource "ibm_is_floating_ip" "itself" {
  name           = var.name
  target         = var.target_network_id
  resource_group = var.resource_group
  tags           = var.tags

  lifecycle {
    ignore_changes = [resource_group]
  }
}

output "floating_ip_address" {
  value = ibm_is_floating_ip.itself.address
}