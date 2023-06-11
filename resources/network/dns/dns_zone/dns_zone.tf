/*
    Creates IBM Cloud DNS Zone.
*/

terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
    }
  }
}

variable "dns_domain" {}
variable "dns_service_id" {}

resource "ibm_dns_zone" "itself" {
  instance_id = var.dns_service_id
  name        = var.dns_domain
}

output "id" {
  value = ibm_dns_zone.itself.zone_id
}
