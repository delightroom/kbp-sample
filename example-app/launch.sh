#!/bin/sh

PASSWORD=$(cat /etc/redis-passwd/password)

if [[ "${HOSTNAME}" == "redis-0" ]]; then
  echo "Launching Redis in master mode"
  redis-server --requirepass "${PASSWORD}"
else
  echo "Launching Redis in slave mode"
  redis-server --slaveof redis-0.redis 6379 --masterauth "${PASSWORD}" --requirepass "${PASSWORD}"
fi