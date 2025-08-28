terraform {
  required_providers {
    keycloak = {
      source  = "keycloak/keycloak"
      version = ">= 5.0.0"
    }
  }
}

variable "realm_id" {
  type        = string
  description = "ID of the realm where the client should be created"
}

variable "client_id" {
  type        = string
  description = "The client ID (no-namespaces)"
}

variable "client_name" {
  type        = string
  description = "Display name of the client"
}

variable "redirect_uris" {
  type    = list(string)
  default = []
}

variable "base_url" {
  type    = string
  default = ""
}

variable "web_origins" {
  type    = list(string)
  default = []
}

resource "keycloak_openid_client" "this" {
  realm_id  = var.realm_id
  client_id = var.client_id
  name      = var.client_name

  enabled               = true
  access_type           = "CONFIDENTIAL"
  standard_flow_enabled = true

  valid_redirect_uris = var.redirect_uris
  base_url            = var.base_url
  web_origins         = var.web_origins
}

output "id" {
  value = keycloak_openid_client.this.id
}

output "secret" {
  value     = keycloak_openid_client.this.client_secret
  sensitive = true
}
