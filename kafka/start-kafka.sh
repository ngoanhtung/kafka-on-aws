#!/bin/bash
# start-kafka.sh
if [ -z "$KAFKA_PORT" ]; then
    export KAFKA_PORT=-1
fi

$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties \
    --override listeners=${KAFKA_LISTENERS:-PLAINTEXT://:9092} \
    --override zookeeper.connect=${ZOOKEEPER_CONNECT:-zookeeper:2181} \
    --override advertised.listeners=${KAFKA_ADVERTISED_LISTENERS:-PLAINTEXT://localhost:9092} \
    --override port=$KAFKA_PORT