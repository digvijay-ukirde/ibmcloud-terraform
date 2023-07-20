/*
    Creates IBM Cloud Public/internet gateway.
*/

terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
    }
  }
}

variable "public_gw_name" {}
variable "vpc_id" {}
variable "zone" {}
variable "resource_group_id" {}
variable "tags" {}

resource "ibm_is_public_gateway" "itself" {
  name           = var.public_gw_name
  resource_group = var.resource_group_id
  vpc            = var.vpc_id
  zone           = var.zone
  tags           = var.tags
}

output "id" {
  value = ibm_is_public_gateway.itself.id
}
