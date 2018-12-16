#!/bin/bash

NODE_ID=$(echo $(hostname) | awk '{print substr($0,length,1)}')
echo "NODE_ID is $NODE_ID"

sed -i "s/REPLICA_NAME/replica$NODE_ID/" /etc/clickhouse-server/config.d/macros.xml

/usr/bin/clickhouse-server --config=${CLICKHOUSE_CONFIG}