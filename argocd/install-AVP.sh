# create argocd namespace in vault from the ui
# create approle auth method in vault in the argocd namespace
#create a policy in vault for argocd namespace
# create a role called argocd in vault for argocd namespace
# create a secret-id in vault for argocd 
vault write -f  -namespace=argocd auth/approle/role/argocd-role
vault read -namespace=argocd auth/approle/role/argocd-role/role-id
vault write -namespace=argocd auth/approle/role/argocd-role policies=argocd-policy
vault write -f -namespace=argocd auth/approle/role/argocd-role/secret-id


# create a k8s secret with the role-id and secret-id
k create secret generic avp-creds --from_env_file=creds.txt -n argocd
# check the created secret
k get secret -n argocd avp-creds -o json | jq -r .data.VAULT_ADDR | base64 -d

# Edit the argocd-repo-server deployment to add the argocd-vault-plugin
k get -n argocd deploy/argocd-repo-server -o yaml > argocd-repo-server-deploy.yaml

# 1- add a volume named custom-tools with emptyDir
# 2- create another init container to download the argocd-vault-plugin binary by mounting the custom-tools volume
#    and copying the binary to /usr/local/bin/argocd-vault-plugin
# 3- mount the custom-tools volume to the argocd-repo-server container at /usr/local/bin/argocd-vault-plugin
# 4- add the envFrom directive to the argocd-repo-server container to use the avp-creds secret

k apply -f argocd-repo-server-deploy.yaml

# register the argocd-vault-plugin with argocd-cm
k edit -n argocd configmap argocd-cm
# add the following under data:

data:
  configManagementPlugins: |-
    - name: argocd-vault-plugin
      generate:
        command: ["argocd-vault-plugin"]
        args: ["generate", "./"]

# restart the argocd-repo-server deployment
k rollout restart -n argocd deploy/argocd-repo-server
k rollout restart -n argocd deploy/argocd-server

# create a new app in argocd that uses the argocd-vault-plugin