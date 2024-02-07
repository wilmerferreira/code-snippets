# PostgreSQL

Postgres by default runs on port `5432`, and when not specified connects to the `postgres` database

## IDEs

- [Arctype](https://www.arctype.com/)
- [Beekeeper Studio](https://www.beekeeperstudio.io/)
- [DataGrip](https://www.jetbrains.com/datagrip/)
- [DBeaver](https://dbeaver.io/)
- [HeidiSQL](https://www.heidisql.com/)
- [Navicat for PostgreSQL](https://www.navicat.com/en/products/navicat-for-postgresql)
- [pgAdmin](https://www.pgadmin.org/)
- [QueryPie](https://www.querypie.com/en)
- [SQLGate](https://www.sqlgate.com/)
- [TablePlus](https://tableplus.com/)
- [ToadEdge](https://www.quest.com/products/toad-edge/) (Trial)

## Docker

Running Postgres in docker using the [official image](https://hub.docker.com/_/postgres/)

```sh
docker run --name postgres -d -e POSTGRES_PASSWORD=postgres -p "5432:5432" -v "F:\:/mnt/shared" --restart=always postgres
```

## Connection String

`Server=127.0.0.1;Port=5432;Database=myDataBase;User Id=postgres;Password=postgres;`

## More Information

- [Postgres Docs](https://www.postgresql.org/docs/)
  - [System Functions](https://www.postgresql.org/docs/9.5/functions-info.html)
  - [System Views](https://www.postgresql.org/docs/current/views-overview.html)
- [Connection Strings](https://www.connectionstrings.com/postgresql/)
