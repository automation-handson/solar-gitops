output "namespaces_path_fq" {
  value = [for p in vault_namespace.children : p.path_fq]
}