# Kafka: Console

## Confluent platform commands (Confluent Enterprise)

### Linux / WSL

- Start the confluent service

  ```sh
  ./confluent start
  ```

- Stop the confluent service

  ```sh
  ./confluent stop
  ```

- Destroy (reset) the confluent service

  ```sh
  ./confluent destroy
  ```

### Windows

- Start zookeeper

  ```ps
  .\bin\windows\zookeeper-server-start.bat .\config\zookeeper.properties
  ```

- Start kafka server

  ```ps
  .\bin\windows\kafka-server-start.bat .\config\server.properties
  ```

## Topics

- List

  ```sh
  ./kafka-topics \
    --zookeeper localhost:2181 \
    --list
  ```

- Create

  ```sh
  ./kafka-topics \
    --zookeeper localhost:2181 \
    --create \
    --partitions 1 \
    --replication-factor 1 \
    --topic TOPIC_NAME
  ```

- Alter

  ```sh
  ./kafka-topics \
    --zookeeper localhost:2181 \
    --alter \
    --partitions 3 \
    --replication-factor 1 \
    --topic TOPIC_NAME
  ```

  - Describe

    ```sh
    kafka-topics \
      --zookeeper nft-zookeeper:2181 \
      --describe
    ```

- Delete

  ```sh
  ./kafka-topics \
    --delete \
    --zookeeper localhost:2181 \
    --topic TOPIC_NAME
  ```

## Consumer Groups

- List Consumers

  ```sh
  kafka-consumer-groups \
    --bootstrap-server localhost:9092 \
    --list
  ```

- Describe Consumers

  ```sh
  kafka-consumer-groups \
    --bootstrap-server localhost:9092 \
    --describe \
    --group CONSUMER_GROUP_NAME
  ```

## Console Consumer

- Consume

  ```sh
  ./kafka-console-consumer \
    --zookeeper localhost:2181 \
    --whitelist sqlServer.localhost.reservations.*
  ```

- Consume using _whitelist_

  ```sh
  ./kafka-console-consumer \
    --zookeeper localhost:2181 \
    --whitelist TOPIC_PREFIX*
  ```
  
## Avro Console Consumer

- Consume

  ```sh
  ./kafka-avro-console-consumer \
    --zookeeper localhost:2181 \
    --whitelist TOPIC_PREFIX*
  ```

- Consume using _whitelist_

  ```sh
  ./kafka-avro-console-consumer \
    --zookeeper localhost:2181 \
    --topic TOPIC_NAME
  ```
