#!/usr/bin/env bash
while true; do
    echo "rs.status().ok" | mongo mongodb://mongo-rs0-0:27017 --quiet &&
    echo "rs.status().ok" | mongo mongodb://mongo-rs0-1:27017 --quiet &&
    echo "rs.status().ok" | mongo mongodb://mongo-rs0-2:27017 --quiet
    if [[ 0 == $? ]]; then
        break
    fi
    echo 'Wait for all mongo replica ready...'
    sleep 1
done
cn=$(echo "rs.status().codeName" | mongo mongodb://mongo-rs0-0:27017 --quiet)
if [[ "$cn" == "NotYetInitialized" ]]; then
    echo "==> Initialize ..."
    mongo mongodb://mongo-rs0-0:27017 <replicaSet.js
else
    echo "==> Reconfig ..."
    while true; do

        host0=$(echo "rs.conf().members[0].host" | mongo mongodb://mongo-rs0-0:27017 --quiet)
        if [[ "${host0}" == *"27010"* ]]; then
            break
        fi
        echo 'Wait for rs.conf() ready...'
        sleep 1
    done
    mongo mongodb://mongo-rs0-0:27017 <replicaSetReconfig.js
fi



