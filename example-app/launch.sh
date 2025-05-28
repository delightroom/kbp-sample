#! /bin/bash

PASSOWRD=$(cat /etc/redis-passwd/redis-passwd)

if [[ "${HOSTNAME}" == "redis-0" ]]; then
redis-server --requirepass $PASSOWRD
else
redis-server --slaveof redis-0 6379 --masterauth $PASSOWRD
   --requirepass $PASSOWRD
fi