# Create Docker Credential for kaniko
k create secret generic -n jenkins kaniko-secret --from-file config.json
# find the Jenkinsfile and the pod agent configuration at https://github.com/anas1243/solar-system.git

