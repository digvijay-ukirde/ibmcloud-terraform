terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
    }
  }
}

variable "vpc" {}
variable "resource_group" {}
variable "tags" {}
variable "name" {}

resource "ibm_is_security_group" "itself" {
  name           = var.name
  vpc            = var.vpc
  resource_group = var.resource_group
  tags           = var.tags
}


output "id" {
  value = ibm_is_security_group.itself.id
}