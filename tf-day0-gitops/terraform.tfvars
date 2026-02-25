parent_namespace = "root"
namespaces_list  = ["dev", "test", "prod"]

admin_policy_object = {
  policy_name = "admin-policy"
  policy_body = "policies/namespace_admins.hcl"
}

dev_policy_object = {
  policy_name = "dev-policy"
  policy_body = "policies/dev_policy.hcl"
}

test_policy_object = {
  policy_name = "test-policy"
  policy_body = "policies/test_policy.hcl"
}

prod_policy_object = {
  policy_name = "prod-policy"
  policy_body = "policies/prod_policy.hcl"
}

kv_path = "secrets"
kv_type = "kv-v2"