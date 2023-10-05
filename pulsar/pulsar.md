# Pulsar

## Components

Main Components:

- ZooKeeper
- Pulsar Broker
- BookKeeper: manage bookie nodes
  - Bookie(s): physical storage of the messages
    - Fragment(s)
    - Segment(s)

Optional Components:

- [Pulsar Proxy](https://pulsar.apache.org/docs/administration-proxy)
- [Pulsar Schema](https://pulsar.apache.org/docs/schema-get-started) (Schema Registry)
- [Pulsar Manager](https://pulsar.apache.org/docs/administration-pulsar-manager/)
- [Pulsar Functions](https://pulsar.apache.org/docs/functions-overview): lightweight process that can be submitted to an Apache Pulsar Cluster to perform a consumer-transform-produce operation.
- [Pulsar IO](https://pulsar.apache.org/docs/io-overview): built-in feature which is used for integrating an Apache Pulsar cluster with external systems like databases or other messaging technologies, through the use of connectors.
- [Pulsar SQL](https://pulsar.apache.org/docs/sql-overview)

## Structure

1. Clusters
2. Properties: represents a tenant in the system
3. Namespace: administrative unit and has functions such as setting permissions, managing replications across clusters, controlling message expirations, and performing critical operations.
4. Topics
   - Partitions: by default topics are not partitioned. When required this will need a _routing policy_ such as single partitioning, round robin or hash partitioning.
5. Subscriptions

## Subscriptions

Types:

- Exclusive: only one single consumer at any given time
- Failover: multiple subscribers but only one consuming. The other consumers will start receiving messages only when the current receiving consumer fails.
- Shared: multiple subscribers and each of them consuming a portion of the messages

> Each subscription under the same topic can choose different subscription types, so two or more subscription types can coexist on the same topic, which greatly improves the messaging flexibility.

## Message Guarantee

- At least once: does not lose data but could have duplicates.
- At most once: Data can be lost.
- Effectively once: If the broker receives a message more than once, it will recognize the message as a duplicate, therefore it will be discarded.

## Routing Modes

- RoundRobinPartition (default): The producer publish messages or batches of messages, that do not have a specified key, across all partitions in round-robin fashion. Otherwise, if a key is specified for a message, a hash is generated and the message is sent to a specific partition.

- SinglePartition: The producer randomly selects one partition and sends all messages that do not have a specified key. Otherwise, if a key is specified for a message, a hash is generated and the message is sent to a specific partition.

- CustomPartition: If none of the previous routing modes are suitable for you, the CustomPartition give you the possibility to implement a custom MessageRouter.

## Topic Types

- Persistent (default) : all messages are durably stored and replicated on disks.

- Non-persistent : all messages are memory resident and are never persisted on disks. This means, messages can be lost in case of node failure.

## Investigate

- Docker compose with
  - [Pulsar](https://pulsar.apache.org/docs/getting-started-docker)
  - [Pulsar manager](https://pulsar.apache.org/docs/administration-pulsar-manager/)
    - Automate the creation of the `admin` user

- Create solution with at least 2 projects
  - Sender: WebAPI producing messages
  - Receiver: Console app receiving messages

- Implement some examples for messages
  - Simple string message
  - Binary message
  - Typed message?
    > Currently the .NET Client does not support [schema registry](https://pulsar.apache.org/docs/schema-get-started#schema-registry)

- Examples of the subscription types
  - Add more than one receiver

- Other topics to investigate
  - Properties and [namespaces](https://pulsar.apache.org/docs/concepts-messaging/#namespaces)
  - [Acknowledgement](https://pulsar.apache.org/docs/concepts-messaging/#acknowledgement)
  - Hardening topics (avoid automatic creation)
  - [Partitioning](https://pulsar.apache.org/docs/concepts-messaging/#partitioned-topics) and [multiple consumers](https://pulsar.apache.org/docs/concepts-messaging/#multi-topic-subscriptions)
  - [Message headers](https://pulsar.apache.org/docs/concepts-messaging/#messages) (useful to add metadata like correlationIDs)

## More Information

- [Apache Pulsar](https://pulsar.apache.org/)
  - [Run Pulsar in Docker](https://pulsar.apache.org/docs/getting-started-docker)
  - [Docs](https://pulsar.apache.org/docs/next)
  - [Pulsar Manager](https://pulsar.apache.org/docs/administration-pulsar-manager/)
- [DotPulsar: The official .NET client library for Apache Pulsar](https://github.com/apache/pulsar-dotpulsar)
- [pulsar-client-dotnet: Unofficial .NET client for Apache Pulsar](https://github.com/fsprojects/pulsar-client-dotnet)
