# PostgreSQL: Access Control

Data Control Language (DCL)

```sql
/* Database ownership */

-- List database ownership
SELECT  d.datname,
        pg_catalog.pg_get_userbyid(d.datdba) as "Owner"
FROM    pg_catalog.pg_database d
WHERE   d.datname = 'applications-subscriptions';

-- Execute this with the current owner account
ALTER DATABASE "applications-subscriptions"
OWNER TO sharedplatservusr;

/* Table ownership */

-- List table owners
SELECT  *
FROM    pg_tables
WHERE   schemaname = 'public';

-- Change the table ownership
ALTER TABLE public."__EFMigrationsHistory"
OWNER TO sharedplatservusr;
```
