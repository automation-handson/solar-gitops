resource "vault_mount" "engine_mount" {
  for_each = toset(var.engine_namespace)
  namespace = each.value
  path        = var.engine_path
  type        = var.engine_type
}
