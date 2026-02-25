#####  Terraform Part for the Core tenants on-boarding  #####

##### Namespaces #####
# Manage namespaces in the parent secrets level
path "sys/namespaces/*" {
  capabilities = ["create", "update", "patch", "delete", "read", "list"]
}

# Manage namespaces in the markets level
path "+/sys/namespaces/*" {
  capabilities = ["create", "update", "patch", "delete", "read", "list"]
}

##### Identities #####

# Create and manage identities (entities, aliases, lookup, identity tokens, OIDC) in the secrets parent level
path "identity/*" {
  capabilities = ["create", "update", "read", "delete", "list"]
}

# Create and manage identities (entities, aliases, lookup, identity tokens, OIDC) in the markets level
path "+/identity/*" {
  capabilities = ["create", "update", "read", "delete", "list"]
}


##### Policies #####

# Manage ACL policies in the secrets parent level
path "sys/policies/acl/*" {
  capabilities = ["read", "create", "update", "delete", "list"]
}

# Manage ACL policies in the markets level
path "+/sys/policies/acl/*" {
  capabilities = ["read", "create", "update", "delete", "list"]
}


##### Auth Methods #####
# List auth methods in the secrets parent level
path "sys/auth" {
  capabilities = ["read"]
}

# Enable, disable, and read auth methods in the secrets parent level
path "sys/auth/*" {
  capabilities = ["read", "create", "update", "delete", "sudo"]
}

# Configure Auth methods and CRUD Auth methods' roles in the secrets parent level
path "auth/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

#### Auth Methods ####

# List auth methods in the Env level
path "+/sys/auth" {
  capabilities = ["read"]
}

# Enable, disable, and read auth methods in the Env level
path "+/sys/auth/*" {
  capabilities = ["read", "create", "update", "delete", "sudo"]
}

# Configure Auth methods and CRUD Auth methods' roles in the Env level
path "+/auth/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

##### Secrets Engines #####

# Enable and Disable engines at the Env level
path "+/sys/mounts/*" {
 capabilities = ["read", "create", "update", "delete", "sudo", "list"]
}

# List Engines in the CLI at the Env level
#If you want to view Engines in the UI you must specify the path in a separate policy path "secrets/*"
path "+/sys/mounts" {
 capabilities = ["read"]
}

# Let DevOps team manage the secrets engine 
path "secrets/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "+/secrets/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

##### Create token for Terraform #####
# Configure Auth methods and CRUD Auth methods' roles in the secrets parent level to let Terraform work properly
path "auth/token/create*" {
  capabilities = ["create", "update", "delete", "sudo"]
}


# To edit the Log level on the fly
path "sys/monitor*" {
  capabilities = ["create", "update", "read", "delete", "list"]
}

##### Root namespace endpoints #####

# Manage Replication
path "sys/replication/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Manage the Raft storage
path "sys/storage/raft/*" {
  capabilities = ["create", "delete", "list", "read", "update"]
}

# step down the active node
path "sys/step-down" {
  capabilities = [ "update", "sudo"]
}

# Enable and disable plugins for all namespaces
path "sys/plugins/*" {
  capabilities = ["create", "update", "delete", "sudo", "list", "read" ]
}

# Encryption Key Rotation of the backend encryption key
path "sys/rotate" {
  capabilities = ["create", "update", "sudo"]
}

# Automated Encryption Key Rotation Configuration
path "sys/rotate/config" {
  capabilities = ["create", "read", "update"]
}

# Get Encryption Key Status
path "sys/key-status" {
  capabilities = ["read"]
}

# check vault usage on vault 1.6+ - HCdiag-ext
path "sys/internal/counters/activity" {
  capabilities = ["read"]
}

# List enabled audit devices
path "sys/audit" {
  capabilities = ["read", "sudo"]
}

# Enable and disable audit devices
path "sys/audit/*" {
  capabilities = ["create", "update", "delete", "sudo" ]
}

# check license status

path "sys/license/status" {
  capabilities = [ "read" ]
}

# Update License Configurations without restart
path "sys/config/reload/license" {
  capabilities = [ "create", "update", "sudo" ]
}

# Manage custom messages in the Vault UI
path "sys/config/ui/custom-messages" {
  capabilities = ["list", "create"]
}

path "sys/config/ui/custom-messages/*" {
  capabilities = ["read", "update", "delete"]
}