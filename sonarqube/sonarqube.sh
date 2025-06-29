# sonarqube uses postgres database as a backend so we need to create one first

# Create a namespace for SonarQube
kubectl create namespace sonarqube
# Create postgres secret
kubectl create secret generic sonarqube-postgres --from-literal=sonarqube-password=sonarqube --from-literal=postgres-password=postgres --namespace sonarqube

# install postgres helm chart
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm install postgres bitnami/postgresql -f postgres-values.yaml --namespace sonarqube

# install sonarqube helm chart
helm repo add sonarqube https://SonarSource.github.io/helm-chart-sonarqube
helm repo update
helm install sonarqube sonarqube/sonarqube -f sonarqube-values.yaml --namespace sonarqube

# add sonarqube.devvf.com to route53 to point to the test-app load balancer and it should take some time, 

helm uninstall sonarqube --namespace sonarqube
helm uninstall postgres --namespace sonarqube