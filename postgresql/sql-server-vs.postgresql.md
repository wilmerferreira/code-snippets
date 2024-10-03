# Differences between SQL Server and PostgreSQL

## Types

| SQL Server                    | PostgreSQL                                                    |
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

## System Functions

### Aggregate Functions

| SQL Server          | PostgreSQL    |
|---------------------|---------------|
| `AVG()`             | `avg()`       |
| `Binary_checksum()` | _TBC_         |
| `Checksum()`        | _TBC_         |
| `Checksun_agg()`    | _TBC_         |
| `COUNT()`           | `count()`     |
| `Count_big()`       | _TBC_         |
| `Grouping()`        | _TBC_         |
| `Grouping_Id()`     | _TBC_         |
| `MAX()`             | `max()`       |
| `MIN()`             | `min()`       |
| `Stdev()`           | _TBC_         |
| `Stdevp()`          | _TBC_         |
| `SUM()`             | `sum()`       |
| `Var()`             | _TBC_         |
| `Varp()`            | _TBC_         |

### Configuration Functions

| SQL Server              | PostgreSQL    |
|-------------------------|---------------|
| `ConnectionProperty()`  | _TBC_         |
| `@@Datefirst`           | _TBC_         |
| `@@Dbst`                | _TBC_         |
| `@@Langid`              | _TBC_         |
| `@@Language`            | _TBC_         |
| `@@Lock_Timeout`        | _TBC_         |
| `@@Max_Connections`     | _TBC_         |
| `@@Max_Precision`       | _TBC_         |
| `@@NestLevel`           | _TBC_         |
| `@@Options`             | _TBC_         |
| `@@Remserver`           | _TBC_         |
| `@@Servername`          | _TBC_         |
| `@@Servicename`         | _TBC_         |
| `@@Spid`                | _TBC_         |
| `@@Textsize`            | _TBC_         |
| `@@Version`             | _TBC_         |

### Cursor Functions

| SQL Server          | PostgreSQL    |
|---------------------|---------------|
| `@@Cursor_Rows`     | _TBC_         |
| `Cursor_Status`     | _TBC_         |
| `@@Fetch_Status`    | _TBC_         |

### Date and Time Functions

| SQL Server                | PostgreSQL                                                                |
|---------------------------|---------------------------------------------------------------------------|
| `@@DATEFIRST`             | `extract(dow from now())`                                                 |
| `CURRENT_TIMESTAMP`       | `now()::timestamp`, `current_timestamp::timestamp` or `localtimestamp(6)` |
| `CURRENT_TIMEZONE()`      | _TBC_                                                                     |
| `CURRENT_TIMEZONE_ID()`   | _TBC_                                                                     |
| `DATE_BUCKET`             | _TBC_                                                                     |
| `DATEADD()`               | Math operations using `interval`                                          |
| `DATEDIFF()`              | `age()`                                                                   |
| `DATEDIFF_BIG()`          | `age()`                                                                   |
| `DATEFROMPARTS()`         | `make_date()` or `to_date()`                                              |
| `DATENAME()`              | `to_char(date, datepart)`                                                 |
| `DATEPART()`              | `date_part()` or `extract()`                                              |
| `DATETIME2FROMPARTS`      | `make_date()` or `to_date()`                                              |
| `DATETIMEFROMPARTS`       | `make_date()` or `to_date()`                                              |
| `DATETIMEOFFSETFROMPARTS` | `make_date()` or `to_date()`                                              |
| `DATETRUNC`               | `date_trunc()`                                                            |
| `DAY()`                   | `date_part('day', value)` or `extract(day from value)`                    |
| `EOMONTH()`               | N/A                                                                       |
| `GETDATE()`               | `now()::timestamp`, `current_timestamp::timestamp` or `localtimestamp(6)` |
| `GETUTCDATE()`            | `now() at time zone 'utc'` or `current_timestamp at time zone 'utc'`      |
| `ISDATE()`                | N/A                                                                       |
| `MONTH()`                 | `date_part('month', value)` or `extract(month from value)`                |
| `SMALLDATETIMEFROMPARTS`  | `make_date()` or `to_date()`                                              |
| `SWITCHOFFSET()`          | _TBC_                                                                     |
| `SYSDATETIME()`           | `now()::timestamp`, `current_timestamp::timestamp` or `localtimestamp(6)` |
| `SYSDATETIMEOFFSET()`     | `now()` or `current_timestamp`                                            |
| `SYSUTCDATETIME()`        | `now() at time zone 'utc'` or `current_timestamp at time zone 'utc'`      |
| `TIMEFROMPARTS()`         | `make_date()` or `to_date()`                                              |
| `TODATETIMEOFFSET()`      | _TBC_                                                                     |
| `YEAR()`                  | `date_part('year', value)` or `extract(year from value)`                  |

### Mathematical Functions

| SQL Server  | PostgreSQL|
|-------------|-----------|
| `Abs()`     | _TBC_     |
| `Acos()`    | _TBC_     |
| `Asin()`    | _TBC_     |
| `Atan()`    | _TBC_     |
| `Atn2()`    | _TBC_     |
| `Ceiling()` | _TBC_     |
| `Cos()`     | _TBC_     |
| `Cot()`     | _TBC_     |
| `Degrees()` | _TBC_     |
| `Exp()`     | _TBC_     |
| `Floor()`   | _TBC_     |
| `Log()`     | _TBC_     |
| `Log100()`  | _TBC_     |
| `Pi()`      | _TBC_     |
| `Power()`   | _TBC_     |
| `Radians()` | _TBC_     |
| `Rand()`    | _TBC_     |
| `Round()`   | _TBC_     |
| `Sign()`    | _TBC_     |
| `Sin()`     | _TBC_     |
| `Sqrt()`    | _TBC_     |
| `Square()`  | _TBC_     |
| `Tan()`     | _TBC_     |

### Metadata Functions

| SQL Server                              | PostgreSQL|
|-----------------------------------------|-----------|
| `Col_Length()`                          | _TBC_     |
| `Col_Name()`                            | _TBC_     |
| `Columproperty()`                       | _TBC_     |
| `Databaseproperty()`                    | _TBC_     |
| `Databasepropertyex()`                  | _TBC_     |
| `Db_Id()`                               | _TBC_     |
| `Db_Name()`                             | _TBC_     |
| `File_Id()`                             | _TBC_     |
| `File_Name()`                           | _TBC_     |
| `Filegroup_Id()`                        | _TBC_     |
| `Filegroup_Name()`                      | _TBC_     |
| `Filegroupproperty()`                   | _TBC_     |
| `Fileproperty()`                        | _TBC_     |
| `::fn_Listextendedproperty()`           | _TBC_     |
| `Fulltextcatalogproperty()`             | _TBC_     |
| `Fulltextserviceproperty()`             | _TBC_     |
| `Index_Col()`                           | _TBC_     |
| `Indexkey_Property()`                   | _TBC_     |
| `Indexproperty()`                       | _TBC_     |
| `Object_Id()`                           | _TBC_     |
| `Object_Name()`                         | _TBC_     |
| `Objectproperty()`                      | _TBC_     |
| `Objectpropertyex()`                    | _TBC_     |
| `@@Procid`                              | _TBC_     |
| `Sql_Variant_Property()`                | _TBC_     |
| `Typeproperty()`                        | _TBC_     |
| `Change_tracking_current_version()`     | _TBC_     |
| `Change_Tracking_Is_Column_In_Mask()`   | _TBC_     |
| `Change_Tracking_Is_Cleanup_Version()`  | _TBC_     |

### Other Functions

| SQL Server                    | PostgreSQL          |
|-------------------------------|---------------------|
| `APP_NAME()`                  | _TBC_               |
| `CAST()`                      | _TBC_               |
| `COALESCE()`                  | `coalesce()`        |
| `COLLATIONPROPERTY()`         | _TBC_               |
| `COLUMNS_UPDATED()`           | _TBC_               |
| `CONVERT()`                   | _TBC_               |
| `CURRENT_USER()`              | _TBC_               |
| `DATALENGTH()`                | _TBC_               |
| `@@ERROR`                     | _TBC_               |
| `FN_HELPCOLLATIONS()`         | _TBC_               |
| `FN_INDEXINFO()`              | _TBC_               |
| `::FN_SERVERSSHAREDDRIVES()`  | _TBC_               |
| `::VIRTUALSERVERNODES()`      | _TBC_               |
| `FORMATMESSAGE()`             | _TBC_               |
| `GETANSINULL()`               | _TBC_               |
| `HOST_ID()`                   | _TBC_               |
| `HOST_NAME()`                 | _TBC_               |
| `IDENT_CURRENT()`             | _TBC_               |
| `IDENT_INCR()`                | _TBC_               |
| `IDENT_SEED()`                | _TBC_               |
| `@@IDENTITY`                  | _TBC_               |
| `IDENTITY()` (Select Into)    | _TBC_               |
| `ISNULL()`                    | `isnull()`          |
| `ISNUMERIC()`                 | _TBC_               |
| `NEWID()`                     | `gen_random_uuid()` |
| `NULLIF()`                    | `nullif()`          |
| `PARSENAME()`                 | _TBC_               |
| `PERMISSIONS()`               | _TBC_               |
| `@@ROWCOUNT`                  | _TBC_               |
| `ROWCOUNT_BIG()`              | _TBC_               |
| `SCOPE_IDENTITY()`            | _TBC_               |
| `SERVERPROPERTY()`            | _TBC_               |
| `SESSIONPROPERTY()`           | _TBC_               |
| `SESSION_USER()`              | _TBC_               |
| `STATS_DATE()`                | _TBC_               |
| `SYSTEM_USER`                 | `CURRENT_USER`      |
| `@@TRANCOUNT`                 | _TBC_               |
| `UPDATE()`                    | _TBC_               |
| `USER_NAME()`                 | _TBC_               |

### Hierarchy Id Functions

TBC

### Rowset Functions

TBC

### Security Functions

TBC

### String Functions

| SQL Server        | PostgreSQL                              |
|-------------------|-----------------------------------------|
| `ASCII()`         | `ascii()`                               |
| `CHAR()`          | `chr()`                                 |
| `CHARINDEX()`     | `strpos()`                              |
|                   | `position()`                            |
| `CONCAT()` or `+` | `concat()`                              |
|                   | `\|\|`                                  |
| `DIFFERENCE()`    | `difference()` (`fuzzystrmatch` module) |
|                   | `levenshtein()`                         |
|                   | `levenshtein_less_equal()`              |
| `LEFT()`          | `left()`                                |
| `LEN()`           | `length()`                              |
| `LOWER()`         | `lower()`                               |
| `LTRIM()`         | `ltrim()`                               |
| `NCHAR()`         | _TBC_                                   |
| `PATINDEX()`      | `strpos()`                              |
|                   | `position()`                            |
| `QUOTENAME()`     | `quote_ident()`                         |
|                   | `quote_literal()`                       |
| `REPLACE()`       | `replace()`                             |
|                   | `regexp_replace()`                      |
| `REPLICATE()`     | `repeat()`                              |
| `Reverse()`       | `reverse()`                             |
| `RIGHT()`         | `right()`                               |
| `RTRIM()`         | `rtrim()`                               |
| `SOUNDEX()`       | `soundex()` (`fuzzystrmatch` module)    |
|                   | `daitch_mokotoff()`                     |
|                   | `metaphone()`                           |
|                   | `dmetaphone()`                          |
|                   | `dmetaphone_alt()`                      |
| `SPACE()`         | `repeat()`                              |
| `STR()`           | `::text`                                |
| `STRING_SPLIT()`  | `string_to_array()` + `unnest()`        |
| `STUFF()`         | `overlay()`                             |
| `SUBSTRING()`     | `substring()`                           |
| `Unicode()`       | `ascii()`                               |
| `UPPER()`         | `upper()`                               |
| `TRIM()`          | `trim()`                                |
| `CONCAT_WS()`     | `concat_ws()`                           |
| N/A               | `initcap()`                             |

### System Statistical Functions

TBC

### Text and Image Functions

TBC

## Operators

| Operator    | Equivalent      |
|-------------|-----------------|
| `+`         | `\|\|`          |
| `LIKE`      | `like`, `ilike` |

Shorthand operators for `like` and `ilike`

| Operator  | Equivalent    |
|-----------|---------------|
| `~~`      | `like`        |
| `~~*`     | `ilike`       |
| `!~~`     | `not like`    |
| `!~~*`    | `not ilike`   |
