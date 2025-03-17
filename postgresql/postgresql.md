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

## Connection String

`Server=127.0.0.1;Port=5432;Database=myDataBase;User Id=postgres;Password=postgres;`

## Docker

Running Postgres in docker using the [official image](https://hub.docker.com/_/postgres/)

> You can connect to the following container using this connection string
> `Server=localhost;Port=5432;Database=postgres;User Id=postgres;Password=postgres;`

```sh
docker run --name postgres -d -e POSTGRES_PASSWORD=postgres -p "5432:5432" -v "D:\:/mnt/shared" --restart=always postgres
```

## Basics

Single line comments start with `--` and multiline comments with `/*` and `*/`

```sql
-- This will create a "sandbox" database
create database sandbox;
```

> After the creation the connection must be changed to that database

```sql
-- This will create a "sandbox" database
create database sandbox;
```

```sql
create table public.countries
(
  -- This will be an auto generated id column that is also a primary key
  country_id serial primary key,

  -- This will be a unique column with a check constraint
  code char(2) null check (alpha_2 is null or length(trim(code)) = 2) unique,

  -- Columns using reserved words must be wrapped between double quotes
  "name" varchar(100) not null check (length(trim("name")) >= 3),

  official_name varchar(150) not null check (length(trim(official_name)) >= 3)
);
```

## Custom Script

```sql
DO $$
DECLARE
    a integer := 10;
    b integer := 20;
    c integer;
BEGIN
    c := a + b;
    RAISE NOTICE'Value of c: %', c;
END $$;
```

## Profiler

```sql
select  backend_type,
        query,
        datname,
        application_name,
        usename,
        pid,
        query_start
FROM    pg_stat_activity;
```

## More Information

- [Postgres Docs](https://www.postgresql.org/docs/)
  - [System Functions](https://www.postgresql.org/docs/9.5/functions-info.html)
  - [System Views](https://www.postgresql.org/docs/current/views-overview.html)
- [Connection Strings](https://www.connectionstrings.com/postgresql/)
