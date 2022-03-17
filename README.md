# Deploy Mongo ReplicaSet

## start
1. copy setup/replicaSet.copy -> setup/replicaSet.js
2. change <HOST_NETWORK_IP> in setup/replicaSet.js
3. copy setup/replicaSetReconfig.copy -> setup/replicaSetReconfig.js
4. change <HOST_NETWORK_IP> in setup/replicaSetReconfig.js
```bash
docker-compose up -d --build
```
## restart(if HOST_NETWORK_IP changes)
1. copy setup/replicaSetReconfig.copy -> setup/replicaSetReconfig.js
2. change <HOST_NETWORK_IP> in setup/replicaSetReconfig.js
```bash
docker-compose down && docker-compose up -d --build
```

## Mongo Connection String
mongodb://host_ip:27010,host_ip:27011,host_ip:27012/?replicaSet=rs0

## Destroy
```bash
docker-compose down
sudo rm -rf ./data
```bash
