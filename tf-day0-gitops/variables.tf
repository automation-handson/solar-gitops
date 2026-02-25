variable "parent_namespace" {
  type        = string
  description = "Parent namespace that will have children"
}
variable "namespaces_list" {
  type        = list(string)
  description = "List of namespaces from the above parent"
}

variable "admin_policy_object" {
  type = object({
    policy_name = string
    policy_body = string
  })
}

variable "dev_policy_object" {
  type = object({
    policy_name = string
    policy_body = string
  })
}

variable "test_policy_object" {
  type = object({
    policy_name = string
    policy_body = string
  })
}

variable "prod_policy_object" {
  type = object({
    policy_name = string
    policy_body = string
  })
}

variable "kv_path" {
  type = string
  description = "The path of the Secrets Engine"
}

variable "kv_type" {
  type = string
  description = "The Type of the Secrets Engine"
}