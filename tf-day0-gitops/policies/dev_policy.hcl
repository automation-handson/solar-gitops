path "secrets/*" {
    capabilities = ["create", "read", "update", "delete", "list", "subscribe"]
    subscribe_event_types = ["kv*"]
}

path "sys/events/subscribe/kv*" {
   capabilities = ["read"]
}