resource "vault_jwt_auth_backend" "oidc" {
  for_each           = toset(var.oidc_namespaces)
  namespace          = each.value
  path               = "oidc"
  type               = "oidc"
  oidc_discovery_url = "https://login.microsoftonline.com/${var.directory_id}/v2.0"
  oidc_client_id     = var.app_id
  oidc_client_secret = var.secret_key
  default_role       = "admins-access"
  tune {
    listing_visibility = "unauth"
  }
}