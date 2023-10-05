# PostgreSQL: Dates & Times

## Types

- `DATE` will be stored as `yyyy-MM-dd`.
- `TIME(p)` will be stored as `hh:mm:ss:ffffff`. `p` determines the number of milliseconds between `0` and `6` (default)
- `TIMESTAMP(p)` will be stored as `yyyy-MM-dd hh:mm:ss:ffffff`. `p` determines the number of milliseconds between `0` and `6` (default)

## Functions

- `AGE()`
- `CURRENT_DATE` without timezone
- `CURRENT_TIME` with timezone
- `CURRENT_TIMESTAMP` with timezone
- `DATE_PART()`
- `DATE_TRUNC()`
- `EXTRACT()`
- `INTERVAL()`
- `justify_days`
- `justify_hours`
- `justify_interval`
- `LOCALTIMESTAMP` without timezone
- `LOCALTIME` without timezone
- `NOW()`
- `TO_DATE()`
- `TO_TIMESTAMP()`

More Information: [PostgreSQL Date Functions](https://www.postgresqltutorial.com/postgresql-date-functions/)

## Casting

```sql
select CAST(now() AS TIME)
```

## Timezones

Available timezones

```sql
SELECT  *
FROM    pg_timezone_names;
```

Converting between timezones

```sql
SELECT  NOW() AT TIME ZONE 'utc' AS "utc_timezone",
        NOW() AT TIME ZONE 'america/los_angeles' AS "named_timezone",
        NOW() AT TIME ZONE 'pst' AS "abbrev_timezone"
```

## Extracting data

More Information: [PostgreSQL EXTRACT Function](https://www.postgresqltutorial.com/postgresql-date-functions/postgresql-extract/)

```sql
-- Date
SELECT EXTRACT(CENTURY FROM NOW())
SELECT EXTRACT(DECADE FROM NOW()) -- The decade that is the year divided by 10
SELECT EXTRACT(YEAR FROM NOW())
SELECT EXTRACT(QUARTER FROM NOW())
SELECT EXTRACT(MONTH FROM NOW())
SELECT EXTRACT(WEEK FROM NOW()) -- The number of the ISO 8601 week-numbering week of the year
SELECT EXTRACT(DOW FROM NOW()) -- The day of week Sunday (0) to Saturday (6)
SELECT EXTRACT(ISODOW FROM NOW()) -- Day of week based on ISO 8601 Monday (1) to Sunday (7)
SELECT EXTRACT(DOY FROM NOW()) -- The day of year that ranges from 1 to 366
SELECT EXTRACT(EPOCH FROM NOW()) -- The number of seconds since 1970-01-01 00:00:00 UTC

-- Time
SELECT EXTRACT(HOUR FROM NOW())
SELECT EXTRACT(MINUTE FROM NOW())
SELECT EXTRACT(SECOND FROM NOW())
SELECT EXTRACT(MILLISECONDS FROM NOW()) -- The seconds field, including fractional parts, multiplied by 1000
SELECT EXTRACT(MICROSECONDS FROM NOW()) -- The seconds field, including fractional parts, multiplied by 1000000

-- Timezone
SELECT EXTRACT(TIMEZONE FROM NOW()) -- The timezone offset from UTC, measured in seconds
SELECT EXTRACT(TIMEZONE_HOUR FROM NOW()) -- The hour component of the time zone offset
SELECT EXTRACT(TIMEZONE_MINUTE FROM NOW()) -- The minute component of the time zone offset
```

## Parsing

### From String

```sql
SELECT TO_TIMESTAMP('2018/08/27/15:23:45', 'YYYY/MM/DD/HH24:MI:ss');
```

### To String

```sql
SELECT to_char('2016-08-12 16:40:32'::timestamp, 'DD Mon YYYY HH:MI:SSPM');
SELECT to_char('2016-08-12 16:40:32'::timestamp, '"Today is "FMDay", the "DDth" day of the month of "FMMonth" of "YYYY');
```

## Investigate

- Cast between types
- Operations on types (e.g. add hours, subtract days)
