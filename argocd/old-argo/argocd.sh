# Install argocd on a k8s cluster
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Deploy ingress for Argocd
k apply -f argocd-ingress.yaml
k apply -f cmp-plugin.yaml

### Then i created a certificate in ACM and i created a route 53 record to access the ingress from argocd.devvf.com ###

# Get the argocd initial password 
 get secret -n argocd argocd-initial-admin-secret -o json | jq -r ".data.password" | base64 -d

### Then i installed the Argocd CLI on my MacBook

homebrew install argocd

# login to the argocd with the admin user the the password retrieved from the previous step!
argocd login argocd.devvf.com


# list apps and clusters
argocd cluster list
argocd app list

# skip the grpc-web

# vi ~/.config/argocd/config  --> then put grpc-web: true  --> under the server section