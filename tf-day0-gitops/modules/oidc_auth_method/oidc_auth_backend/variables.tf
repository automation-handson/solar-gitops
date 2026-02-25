variable "directory_id" {
  type    = string
  default = ""
}

variable "app_id" {
  type    = string
  default = ""
}


variable "secret_key" {
  type    = string
  default = ""
}

variable "oidc_namespaces" {
  type = list(string)
}
