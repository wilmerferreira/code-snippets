# ClickHouse

A high-performance, column-oriented SQL database management system (DBMS) for online analytical processing (OLAP).

## Docker

This uses the [official image from docker hub](https://hub.docker.com/_/mongo/)

```sh
docker run -d --name clickhouse -e CLICKHOUSE_DB=clickhouse -e CLICKHOUSE_USER=clickhouse -e CLICKHOUSE_PASSWORD=clickhouse -e CLICKHOUSE_DEFAULT_ACCESS_MANAGEMENT=1 -p 8123:8123 -p 9000:9000/tcp --restart always clickhouse
```

> We can then connect through `Host=clickhouse;Protocol=https;Port=8443;Username=clickhouse;Password=clickhouse;`

## More Information

- [ClickHouse Docs](https://clickhouse.com/docs)
  - [ClickHouse C# client](https://clickhouse.com/docs/integrations/csharp)
