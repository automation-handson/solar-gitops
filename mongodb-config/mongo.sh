kubectl create secret generic mongo-secret \
  --from-literal=MONGO_INITDB_ROOT_USERNAME=admin \
  --from-literal=MONGO_INITDB_ROOT_PASSWORD=securepassword \
  -n mongodb