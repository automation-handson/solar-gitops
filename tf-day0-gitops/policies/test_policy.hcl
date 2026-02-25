path "secrets/test/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

path "secrets/test" {
    capabilities = ["create", "read", "update", "delete", "list"]
}