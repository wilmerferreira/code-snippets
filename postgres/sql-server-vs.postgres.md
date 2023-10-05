# Differences between SQL Server and PostgreSQL

## Functions

### Date

| SQL Server    | Postgres                          |
|---------------|-----------------------------------|
| `DATEPART()`  | `EXTRACT()`, `DATE_PART()`        |
| `DATEADD()`   | Math operations using `INTERVAL`  |
| `GETDATE()`   | `NOW()`, `CURRENT_TIMESTAMP()`    |
| N/A           | `DATE_TRUNC()`                    |

### Math

TBC

### String

| SQL Server    | Postgres                          |
|---------------|-----------------------------------|
| `LEN()`       | `LENGTH()`                        |
| `&`           | `||`                              |
| N/A           | `initcap()`                       |
| `LIKE`        | `LIKE`, `ILIKE`                   |

Shorthand operators for `like` and `ilike`

| Operator  | Equivalent    |
|-----------|---------------|
| `~~`      | `like`        |
| `~~*`     | `ilike`       |
| `!~~`     | `not like`    |
| `!~~*`    | `not ilike`   |

## Types

| SQL Server                    | Postgres                                                      |
|-------------------------------|---------------------------------------------------------------|
| `BIT`                         | `BOOLEAN`                                                     |
| `DATETIME`, `DATETIME2(p)`    | `TIMESTAMP(p)`                                                |
| `DATETIMEOFFSET(p)`           | `TIMESTAMP(p) WITH TIME ZONE`                                 |
| `SMALLDATETIME`               | `TIMESTAMP(0)`                                                |
| `TINYINT`                     | `SMALLINT`                                                    |
| `VARBINARY(n)`                | `BYTEA`                                                       |
| `VARCHAR(MAX)`                | `TEXT`                                                        |
| `SMALLMONEY`                  | `MONEY`                                                       |
| `GEOMETRY`                    | `POINT`, `LINE`, `LSEG`, `BOX`, `PATH`, `POLYGON`, `CIRCLE`   |
