k create ns dev-solar-app

k create secret generic mongo-uri -n dev-solar-app\
  --from-literal=MONGO_URI="mongodb://<mongo-usr>:<mongo-pass>@mongodb.mongodb.svc.cluster.local:27017/solar-system?authSource=solar-system"