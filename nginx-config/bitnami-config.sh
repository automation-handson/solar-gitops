argocd app create sealed-secrets \
  --repo https://bitnami-labs.github.io/sealed-secrets \
  --helm-chart sealed-secrets \
  --revision 2.2.0 \
  --dest-namespace kube-system \
  --dest-server https://kubernetes.default.svc

brew install kubeseal 

kubeseal -o yaml --scope cluster-wide --controller-name sealed-secrets < nginx-plain-secret.yaml > nginx-sealed-secret.yaml

k apply -f nginx-preinstall.yaml

k apply -f nginx-sealed-secret.yaml

k apply -f nginx.yaml

k exec -it -n nginx nginx-<pod-name> -- /bin/bash

# you will find the index.html file in /vault/secrets directory. also will be visible on the browser bitnami-nginx.devvf.com

# to check the logs of bitnami-sealed-secrets controller
k logs -n kube-system deployments/sealed-secrets

# 2025/08/04 16:00:07 Event(v1.ObjectReference{Kind:"SealedSecret", Namespace:"nginx", Name:"mongo-secret", UID:"3443d19b-bafa-48fb-b498-0538c694bab4", APIVersion:"bitnami.com/v1alpha1", ResourceVersion:"118377049", FieldPath:""}): type: 'Normal' reason: 'Unsealed' SealedSecret unsealed successfully
