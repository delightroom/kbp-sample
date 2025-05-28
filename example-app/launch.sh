#! /bin/bash

PASSWORD=$(cat /etc/redis-passwd/redis-passwd)

if [[ "${HOSTNAME}" == "redis-0" ]]; then
redis-server --requirepass $PASSWORD
else
redis-server --slaveof redis-0 6379 --masterauth $PASSWORD --requirepass $PASSWORD
fi