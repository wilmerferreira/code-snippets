# Kafka: Docker

Images:

- Confluent Enterprise ([confluentinc/cp-enterprise-kafka](https://hub.docker.com/r/confluentinc/cp-enterprise-kafka/))

## Setup

[More information](https://docs.confluent.io/current/installation/docker/docs/quickstart.html#getting-started-with-docker-client)

- Create a custom network

  ```sh
  docker network create confluent
  ```

### Confluent Enterprise

- Pull the image

  ```sh
  docker pull confluentinc/cp-enterprise-kafka
  ```

- Create and run the container

  ```sh
  docker run -d \
    --net=host \
    --name=kafka \
    -e KAFKA_ZOOKEEPER_CONNECT=localhost:32181 \
    -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:29092 \
    -e KAFKA_BROKER_ID=2 \
    -e KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 \
    -e CONFLUENT_SUPPORT_CUSTOMER_ID=c0 \
    confluentinc/cp-enterprise-kafka
  ```

### Independent container

#### Zookeper

- Pull the image

  ```sh
  docker pull confluentinc/cp-zookeeper
  ```

- Create and run the container

  ```sh
  docker run -d \
    --net=host \
    --name=zookeeper \
    -e ZOOKEEPER_CLIENT_PORT=32181 \
    -e ZOOKEEPER_TICK_TIME=2000 \
    -e ZOOKEEPER_SYNC_LIMIT=2 \
    confluentinc/cp-zookeeper
  ```

#### Kafka server

- Pull the image

  ```sh
  docker pull confluentinc/cp-kafka
  ```

- Create and run the container

  ```sh
  docker run -d \
    --net=host \
    --name=kafka \
    -e KAFKA_ZOOKEEPER_CONNECT=localhost:32181 \
    -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:29092 \
    -e KAFKA_BROKER_ID=2 \
    -e KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 \
    confluentinc/cp-kafka
  ```

#### Schema registry

- Pull the image

  ```sh
  docker pull confluentinc/cp-schema-registry
  ```

- Create and run the container

  ```sh
  docker run -d \
    --net=host \
    --name=schema-registry \
    -e SCHEMA_REGISTRY_KAFKASTORE_CONNECTION_URL=localhost:32181 \
    -e SCHEMA_REGISTRY_HOST_NAME=localhost \
    -e SCHEMA_REGISTRY_LISTENERS=http://localhost:8081 \
    -e SCHEMA_REGISTRY_DEBUG=true \
    confluentinc/cp-schema-registry
  ```

#### REST Proxy

- Pull the image

  ```sh
  docker pull confluentinc/cp-kafka-rest
  ```

- Create and run the container

  ```sh
  docker run -d \
    --net=host \
    --name=kafka-rest \
    -e KAFKA_REST_ZOOKEEPER_CONNECT=localhost:32181 \
    -e KAFKA_REST_LISTENERS=http://localhost:8082 \
    -e KAFKA_REST_SCHEMA_REGISTRY_URL=http://localhost:8081 \
    confluentinc/cp-kafka-rest
  ```

#### Kafka Connect

- Pull the image

  ```sh
  docker pull confluentinc/cp-kafka-connect
  ```

- Create and run the container

  ```sh
  docker run -d \
    --name=kafka-connect \
    --net=host \
    -e CONNECT_BOOTSTRAP_SERVERS=localhost:29092 \
    -e CONNECT_REST_PORT=28082 \
    -e CONNECT_GROUP_ID="quickstart" \
    -e CONNECT_CONFIG_STORAGE_TOPIC="quickstart-config" \
    -e CONNECT_OFFSET_STORAGE_TOPIC="quickstart-offsets" \
    -e CONNECT_STATUS_STORAGE_TOPIC="quickstart-status" \
    -e CONNECT_KEY_CONVERTER="org.apache.kafka.connect.json.JsonConverter" \
    -e CONNECT_VALUE_CONVERTER="org.apache.kafka.connect.json.JsonConverter" \
    -e CONNECT_INTERNAL_KEY_CONVERTER="org.apache.kafka.connect.json.JsonConverter" \
    -e CONNECT_INTERNAL_VALUE_CONVERTER="org.apache.kafka.connect.json.JsonConverter" \
    -e CONNECT_REST_ADVERTISED_HOST_NAME="localhost" \
    -e CONNECT_PLUGIN_PATH=/usr/share/java \
    confluentinc/cp-kafka-connect
  ```

#### Control Centre

- Pull the image

  ```sh
  docker pull confluentinc/cp-enterprise-control-center
  ```

- Create and run the container

  ```sh
  docker run -d \
    --net=host \
    --name=control-center \
    --ulimit nofile=16384:16384 \
    -e CONTROL_CENTER_ZOOKEEPER_CONNECT=localhost:32181 \
    -e CONTROL_CENTER_BOOTSTRAP_SERVERS=localhost:29092 \
    -e CONTROL_CENTER_REPLICATION_FACTOR=1 \
    -e CONTROL_CENTER_CONNECT_CLUSTER=http://localhost:28082 \
    -v /mnt/control-center/data:/var/lib/confluent-control-center \
    confluentinc/cp-enterprise-control-center
  ```

#### KSQL Server

- Pull the image

  ```sh
  docker pull confluentinc/cp-ksql-server
  ```

- Create and run the container

  ```sh
  docker run -d \
    -v /path/on/host:/path/in/container/ \
    -e KSQL_BOOTSTRAP_SERVERS=localhost:9092 \
    -e KSQL_KSQL_SERVICE_ID=confluent_standalone_2_ \
    -e KSQL_KSQL_QUERIES_FILE=/path/in/container/queries.sql \
    confluentinc/cp-ksql-server
  ```

## Useful commands

### Interactive mode

1. Open the container interactive mode

   ```sh
   docker exec -it <your_cp_kafka_container_id> /bin/bash
   ```

2. Execute any kafka command

   ```sh
   kafka-topics --list --zookeeper localhost:2181
   ```

### Execute docker commands from host

```sh
docker exec <your_cp_kafka_container_id> <your-kafka-command>
```

e.g.

```ps
docker exec bf0ce1d94306 kafka-topics --list --zookeeper localhost:2181
```
