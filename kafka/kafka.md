# Kafka

## Getting Started

- Clusters
- Brokers
- Producer (Publisher)
- Consumer (Subscriber)
- Topic
- Message
  - Timestamp
  - Identifier

## Products

- Confluent Platform ([comparison](https://www.confluent.io/product/compare/))
  - Apache Kafka
  - Confluent Open Source
    - Additional Clients
    - REST Proxy
    - Schema Registry ([API Reference](https://docs.confluent.io/current/schema-registry/docs/api.html))
    - Pre-Built Connectors
    - KSQL
  - Confluent Enterprise
    - JMS Client
    - Enhanced Security
    - Confluent Control Center
    - Auto Data Balancer
    - Replicator
  - Confluent Cloud
- [Confluent Hub](http://www.confluent.io/hub)
  - [Confluent's .NET Client for Apache Kafka](https://github.com/confluentinc/confluent-kafka-dotnet)

Other dependencies:

- [Apache Avro](https://avro.apache.org/docs/current/spec.html)

Default service ports

| Service                   | Port  | JMX   |
|---------------------------|-------|-------|
| Kafka Broker              | 9092  | 9581  |
| Schema Registry           | 8081  | 9582  |
| Kafka Rest Proxy          | 8082  | 9583  |
| Kafka Connect Distributed | 8083  | 9584  |
| Zookeeper                 | 2181  |       |
| Control Center            | 9021  |       |
| KSQL UI                   | 8088  |       |

## Installation

### Linux / WSL

1. Ensure that java is properly installed and configured ([more information](https://www.linode.com/docs/development/java/install-java-on-ubuntu-16-04/))

   - `sudo apt-get update`
   - `sudo apt-get upgrade`
   - `sudo apt-get install software-properties-common`
   - `sudo add-apt-repository ppa:webupd8team/java`
   - `sudo apt-get update`
   - `sudo apt-get install oracle-java8-installer`
   - `java -version`

2. [Download Confluent Enterprise](https://www.confluent.io/download/) (.tar.gz)
3. Extract the file in a convenient location.

    ```sh
    tar -xzf confluent-4.1.1-2.11.tar.gz
    ```

4. Start the services, go to the bin location and execute the following command

   ```sh
   ./confluent start
   ```

   or start each service independently

   - Zookeeper

     ```sh
     # Start ZooKeeper.  Run this command in its own terminal.
     $ ./bin/zookeeper-server-start ./etc/kafka/zookeeper.properties

   - Kafka Server

     ```sh
     # Start Kafka.  Run this command in its own terminal.
     ./bin/kafka-server-start ./etc/kafka/server.properties
     ```

   - Schema Registry

     ```sh
     # Start Schema Registry. Run this command in its own terminal.
     ./bin/schema-registry-start ./etc/schema-registry/schema-registry.properties
     ```

   - Kafka Connect

     ```sh
     # Start Connect in distributed mode. Run this command in its own terminal.
     ./bin/connect-distributed ./etc/schema-registry/connect-avro-distributed.properties
     ```

### Windows

> Pending

### Docker - Lenses Box

```ps
docker run `
  -d `
  -e ADV_HOST=127.0.0.1 `
  -e EULA="https://dl.lenses.io/d/?id=f10d7ab0-005a-4f6a-8abd-576e0841ed41" `
  -e KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092 `
  -e SAMPLEDATA=0 `
  -p 2181:2181 `
  -p 3030:3030 `
  -p 8081:8081 `
  -p 9092:9092 `
  --name "lensesio-box" `
  --restart unless-stopped `
  lensesio/box
```

## More information

- [Slack workspace](http://confluentcommunity.slack.com)
- Confluent Contacts
  - Will Newman (Account Manager)
  - Simon Leigh (Systems Engineer)
