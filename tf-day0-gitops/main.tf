terraform {
  backend "s3" {
    bucket       = "vci-terraform-statefiles"
    key          = "day0-gitops.tfstate"
    region       = "eu-central-1"
    use_lockfile = true
  }
}

module "env_namespaces" {
  source           = "./modules/namespaces"
  parent_namespace = var.parent_namespace
  namespaces_list  = var.namespaces_list
}

locals {
  admin_policy = {
    policy_name = var.admin_policy_object.policy_name
    policy_body = file(var.admin_policy_object.policy_body)
  }
  dev_policy = {
    policy_name = var.dev_policy_object.policy_name
    policy_body = file(var.dev_policy_object.policy_body)
  }
  test_policy = {
    policy_name = var.test_policy_object.policy_name
    policy_body = file(var.test_policy_object.policy_body)
  }
  prod_policy = {
    policy_name = var.prod_policy_object.policy_name
    policy_body = file(var.prod_policy_object.policy_body)
  }
}

module "admin_policy" {
  source            = "./modules/policies"
  policy_object     = local.admin_policy
  policy_namespaces = ["root"]
  depends_on = [ module.env_namespaces ]
}

module "dev_policies" {
  source            = "./modules/policies"
  policy_object     = local.dev_policy
  policy_namespaces = [var.namespaces_list[0]]
  depends_on = [ module.env_namespaces ]
}

module "test_policies" {
  source            = "./modules/policies"
  policy_object     = local.test_policy
  policy_namespaces = [var.namespaces_list[1]]
  depends_on = [ module.env_namespaces ]
}

module "prod_policies" {
  source            = "./modules/policies"
  policy_object     = local.prod_policy
  policy_namespaces = [var.namespaces_list[2]]
  depends_on = [ module.env_namespaces ]
}

module "secrets_engine" {
  source = "./modules/engine_mount"
  engine_path = var.kv_path
  engine_type = var.kv_type
  engine_namespace = concat(["root"], var.namespaces_list)
  depends_on = [ module.env_namespaces ]
}

## K8s Authentication method to be added for all namespaces