# Deploy Mongo ReplicaSet

## Start
 
```bash
cp setup/setup-init.sh.copy setup/setup.sh
cp setup/replicaSet.copy setup/replicaSet.js
```
Change <HOST_NETWORK_IP> in setup/replicaSet.js.

```bash
docker-compose up -d --build
```
## Restart (if HOST_NETWORK_IP changes)
```bash
cp setup/setup-reconfig.sh.copy setup/setup.sh
cp setup/replicaSetReconfig.copy setup/replicaSetReconfig.js
```
Change <HOST_NETWORK_IP> in setup/replicaSetReconfig.js.
```bash
docker-compose down && docker-compose up -d --build
```

## Mongo Connection String
mongodb://<HOST_NETWORK_IP>:27010,<HOST_NETWORK_IP>:27011,<HOST_NETWORK_IP>:27012/?replicaSet=rs0

## Destroy
```bash
docker-compose down
sudo rm -rf ./data
```
