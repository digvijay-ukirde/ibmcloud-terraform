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

  icmp {
    type = 8
    code = 20
  }
}

output "id" {
  value = ibm_is_security_group_rule.itself[*].id
}
