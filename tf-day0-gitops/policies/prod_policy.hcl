path "secrets/prod/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

path "secrets/prod" {
    capabilities = ["create", "read", "update", "delete", "list"]
}