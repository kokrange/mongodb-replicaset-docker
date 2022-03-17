# Deploy Mongo ReplicaSet

## start
 
```bash
cp setup/replicaSet.copy setup/replicaSet.js
cp setup/replicaSetReconfig.copy setup/replicaSetReconfig.js
```
Change <HOST_NETWORK_IP> in setup/replicaSet.js & setup/replicaSetReconfig.js both.

```bash
docker-compose up -d --build
```
## restart(if HOST_NETWORK_IP changes)
```bash
cp setup/replicaSetReconfig.copy setup/replicaSetReconfig.js
```
Change <HOST_NETWORK_IP> in setup/replicaSetReconfig.js.
```bash
docker-compose down && docker-compose up -d --build
```

## Mongo Connection String
mongodb://host_ip:27010,host_ip:27011,host_ip:27012/?replicaSet=rs0

## Destroy
```bash
docker-compose down
sudo rm -rf ./data
```
