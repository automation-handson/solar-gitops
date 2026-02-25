path "secrets/dev/*" {
    capabilities = ["create", "read", "update", "delete", "list"]
}

path "secrets/dev" {
    capabilities = ["create", "read", "update", "delete", "list"]
}