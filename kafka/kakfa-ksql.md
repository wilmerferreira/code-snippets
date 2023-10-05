# Kafka: KSQL

- A **stream** in Kafka records the full history of world (or business) events from the beginning of time to today. It represents the past and the present. As we go from today to tomorrow, new events are constantly being added to the world’s history. This history is a sequence or “chain” of events, so you know which event happened before another event.
- A **table** in Kafka is the state of the world today. It represents the present. It is an aggregation of the history of world events, and this aggregation is changing constantly as we go from today to tomorrow.

## Connect to ksql

```sh
docker exec -it ksql-cli ksql http://ksql-server:8088
```

## Examples

### CREATE

> _Objects_ should be unique, this means you cannot create streams and tables with the same name

- Streams

  ```ksql
  CREATE STREAM HOTEL_MAPPINGS_STREAM
  WITH
  (
      KAFKA_TOPIC = 'memphis.mappings.hotels',
      VALUE_FORMAT = 'AVRO'
  );
  ```

  ```ksql
  CREATE STREAM DESTINATION_MAPPINGS_STREAM
  WITH
  (
      KAFKA_TOPIC = 'memphis.margins.destinations',
      VALUE_FORMAT = 'AVRO'
  );
  ```

- Tables

  ```ksql
  CREATE TABLE FLIGHT_MARGINS
  WITH
  (
      KAFKA_TOPIC = 'memphis.margins.flights',
      VALUE_FORMAT = 'AVRO'
  );
  ```

  ```ksql
  CREATE TABLE HOTEL_MAPPINGS
  WITH
  (
      KAFKA_TOPIC = 'memphis.mappings.hotels',
      VALUE_FORMAT = 'AVRO'
  );
  ```

### DESCRIBE

- Topic: `DESCRIBE EXTENDED MY_TOPIC_NAME;`

### LIST/SHOW

- Streams: `LIST STREAMS;`
- Tables: `LIST TABLES;`
- Topics: `LIST TOPICS;`

### PRINT

`PRINT 'memphis.mappings.hotels' FROM BEGINNING LIMIT 5;`
`PRINT 'memphis.margins.flights' FROM BEGINNING LIMIT 5;`

## Questions

- Where the `streams` and `tables` are stored?
  - Are they destroyed if we recreate the pod?
- Can I create a `stream` and `table` from beginning?
  - `SET 'auto.offset.reset' = 'earliest';`?
- How can we change the ksql client to use an specific address by default?
- How can I display the message key in `stream` and `table`?
  - We use `avro` keys

## References

- [ksqlDB Developer Guide](https://docs.ksqldb.io/en/latest/developer-guide/)
- [KSQL Syntax Reference](https://docs.confluent.io/current/ksql/docs/developer-guide/syntax-reference.html#)
- [Of Streams and Tables in Kafka and Stream Processing, Part 1](https://www.michael-noll.com/blog/2018/04/05/of-stream-and-tables-in-kafka-and-stream-processing-part1/)
