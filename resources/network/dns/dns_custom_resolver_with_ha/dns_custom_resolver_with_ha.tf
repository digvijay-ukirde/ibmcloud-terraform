terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
    }
  }
}

variable "customer_resolver_name" {}
variable "instance_guid" {}
variable "subnet_crn" {}

resource "ibm_dns_custom_resolver" "itself" {
  name        = var.customer_resolver_name
  instance_id = var.instance_guid
  enabled     = true
  locations {
    subnet_crn = var.subnet_crn[0]
    enabled    = true
  }
  locations {
    subnet_crn = var.subnet_crn[1]
    enabled    = true
  }
}

output "id" {
  value = ibm_dns_custom_resolver.itself.custom_resolver_id
}