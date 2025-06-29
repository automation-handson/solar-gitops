#  Add Jenkins helm chart
helm repo add jenkinsci https://charts.jenkins.io
helm repo update

# Create Jenkins ns
k create ns jenkins

# install Jenkins helm chart
chart=jenkinsci/jenkins
helm install jenkins -n jenkins -f jenkins-values.yaml $chart

# Upgrade Jenkins helm chart
chart=jenkinsci/jenkins
helm upgrade jenkins -n jenkins -f jenkins-values.yaml $chart