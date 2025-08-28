terraform {
  required_providers {
    keycloak = {
      source  = "keycloak/keycloak"
      version = ">= 5.0.0"
    }
  }
}

provider "keycloak" {
  client_id = "admin-cli"
  username  = var.keycloak_username
  password  = var.keycloak_password
  url       = var.keycloak_url
}

variable "keycloak_username" {
  type        = string
  default     = "admin"
  description = "The username for the Keycloak admin user"
}

variable "keycloak_url" {
  type        = string
  default     = "http://localhost:63595"
  description = "The URL of the Keycloak server"
}

variable "keycloak_password" {
  type        = string
  default     = "ChangeMe_please"
  sensitive   = true
  description = "The password for the Keycloak admin user"
}
