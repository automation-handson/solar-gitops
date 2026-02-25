resource "vault_namespace" "parent" {
  count = var.parent_namespace != "root" ? 1 : 0
  path  = var.parent_namespace
}

resource "vault_namespace" "children" {
  for_each   = toset([for ns in var.namespaces_list : ns])
  namespace  = var.parent_namespace
  path       = each.value
  depends_on = [vault_namespace.parent]
}