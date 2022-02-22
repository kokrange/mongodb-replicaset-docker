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
    mongo mongodb://mongo-rs0-0:27017 <replicaSet.js
fi
