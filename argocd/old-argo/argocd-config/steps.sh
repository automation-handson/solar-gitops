helm install argocd argo/argo-cd -n argocd -f argocd-values.yaml
helm upgrade argocd argo/argo-cd -n argocd -f argocd-values.yaml