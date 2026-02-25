variable "policy_namespaces" {
  type        = list(string)
  description = "List of namespaces that will contain the policy"
}

variable "policy_object" {
  type = object({
    policy_name = string
    policy_body = string
  })
}