# vault provider
provider "vault" {
  set_namespace_from_token = false
}

terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "5.1.0"
    }
  }
}