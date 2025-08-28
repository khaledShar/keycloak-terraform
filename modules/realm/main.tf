terraform {
  required_providers {
    keycloak = {
      source  = "keycloak/keycloak"
      version = ">= 5.0.0"
    }
  }
}

variable "realm_name" {
  type        = string
  description = "Name of the Keycloak realm"
}

variable "enabled" {
  type    = bool
  default = true
}

resource "keycloak_realm" "this" {
  realm   = var.realm_name
  enabled = var.enabled
}

output "id" {
  value = keycloak_realm.this.id
}
