terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
    }
  }
}

variable "service_instance_name" {}
variable "resource_group_id" {}
variable "target_location" {}
variable "service_name" {}
variable "plan_type" {}

resource "ibm_resource_instance" "itself" {
  name              = var.service_instance_name
  resource_group_id = var.resource_group_id
  location          = var.target_location
  service           = var.service_name
  plan              = var.plan_type
}

output "id" {
  value = ibm_resource_instance.itself.guid
}