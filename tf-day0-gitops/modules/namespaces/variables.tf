variable "parent_namespace" {
  type        = string
  description = "Parent namespace that will have children"
}
variable "namespaces_list" {
  type        = list(string)
  description = "List of namespaces from the above parent"
}