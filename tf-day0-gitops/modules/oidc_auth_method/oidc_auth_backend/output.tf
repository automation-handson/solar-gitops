output "oidc_auth_accessor" {
  value = { for oidc in vault_jwt_auth_backend.oidc : oidc.namespace => oidc.accessor }
}