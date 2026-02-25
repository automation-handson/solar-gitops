
variable "app_url" {
  type    = string
  default = ""
}

variable "group_id" {
  type    = string
  default = ""
}

variable "oidc_namespaces" {
  type = list(string)
}
