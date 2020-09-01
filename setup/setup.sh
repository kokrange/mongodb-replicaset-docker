#!/usr/bin/env bash

set -e

sleep 10 | echo Sleeping

mongo mongodb://mongo-rs0-0:27017 < replicaSet.js
