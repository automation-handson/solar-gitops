resource "vault_policy" "policy" {
  for_each  = toset([for ns in var.policy_namespaces : ns])
  namespace = each.value
  name      = var.policy_object.policy_name
  policy    = var.policy_object.policy_body
}