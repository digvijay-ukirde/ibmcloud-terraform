terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
    }
  }
}

variable "group" {}
variable "direction" {}
variable "remote" {}

resource "ibm_is_security_group_rule" "itself" {
  group     = var.group
  direction = var.direction
  remote    = var.remote

  tcp {
    port_min = 22
    port_max = 22
  }
}

output "id" {
  value = ibm_is_security_group_rule.itself[*].id
}
