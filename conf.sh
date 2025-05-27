k create ns solar-app

k create secret generic mongo-uri -n solar-app\
  --from-literal=MONGO_URI="mongodb://<mongo-usr>:<mongo-pass>@mongodb.mongodb.svc.cluster.local:27017/solar-system?authSource=solar-system"