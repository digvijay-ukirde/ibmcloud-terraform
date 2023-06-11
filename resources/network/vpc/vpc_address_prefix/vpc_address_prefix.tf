/*
    Creates new IBM VPC address prefixes.
*/

terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
    }
  }
}

variable "vpc_id" {}
variable "address_name" {}
variable "zone" {}
variable "cidr_block" {}

resource "ibm_is_vpc_address_prefix" "itself" {
  name = var.address_name
  vpc  = var.vpc_id
  zone = var.zone
  cidr = var.cidr_block
}

output "id" {
  value = ibm_is_vpc_address_prefix.itself.id
}
