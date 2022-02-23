# Deploy Mongo ReplicaSet

./deploy
### or manually
1. copy setup/replicaSet.copy -> setup/replicaSet.js
2. change <HOST_NETWORK_IP> in setup/replicaSet.js
3. docker-compose up -d --build

## GUI

vist http://host_ip:1234

## Mongo Connection String

mongodb://host_ip:27010,host_ip:27011,host_ip:27012/?replicaSet=rs0

## Destroy

docker-compose down

sudo rm -rf ./data
