# Deploy Mongo ReplicaSet

./deploy

## GUI

vist http://host_ip:1234

## Mongo Connection String

mongodb://host_ip:27010,host_ip:27011,host_ip:27012/?replicaSet=rs0

## Destroy

docker-compose down

sudo rm -rf ./data
