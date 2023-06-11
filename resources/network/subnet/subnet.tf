/*
   Creates IBM Cloud new Subnet(s).
*/

terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
    }
  }
}

variable "vpc_id" {}
variable "zone" {}
variable "subnet_name" {}
variable "subnet_cidr_block" {}
variable "public_gateway" {}
variable "resource_group_id" {}

resource "ibm_is_subnet" "itself" {
  name            = var.subnet_name
  resource_group  = var.resource_group_id
  vpc             = var.vpc_id
  zone            = var.zone
  ipv4_cidr_block = var.subnet_cidr_block
  public_gateway  = var.public_gateway
}

output "id" {
  value = ibm_is_subnet.itself.id
}

output "crn" {
  value = ibm_is_subnet.itself.crn
}
