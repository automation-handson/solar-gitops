resource "vault_jwt_auth_backend_role" "oidc" {
  for_each       = toset(var.oidc_namespaces)
  namespace      = each.value
  backend        = "oidc"
  role_name      = "admins-access"
  token_policies = []

  user_claim   = "email"
  groups_claim = "groups"

  bound_claims = {
    groups = var.group_id
  }

  role_type = "oidc"
  allowed_redirect_uris = [
    "${var.app_url}:443/oidc/callback",
    "${var.app_url}/ui/vault/auth/oidc/oidc/callback",
  ]
  oidc_scopes = ["https://graph.microsoft.com/.default"]
}
