# SQL Server

## DateTime

### Functions

- `CURRENT_TIMESTAMP`: This function returns the current database system timestamp as a datetime value, without the database time zone offset. This is the ANSI standard equivalent to `GETDATE()` .

- `DATEADD`
- `DATEDIFF`
- `DATENAME`
- `DATEPART`
- `DAY`
- `GETDATE`
- `GETUTCDATE`
- `ISDATE`
- `MONTH`
- `SYSDATETIME`
- `SYSDATETIMEOFFSET`
- `SYSUTCDATETIME`
- `SWITCHOFFSET`
- `TODATETIMEOFFSET`
- `YEAR`

### Expressions

`AT TIME ZONE`

```sql
/*************************************************************************/
/* Be aware than the time zone offset can change during summer or winter */
/*************************************************************************/

DECLARE @Now        DATETIME = SYSDATETIME()
DECLARE @MyDate     DATETIMEOFFSET = TODATETIMEOFFSET(@Now, '+01:00')
DECLARE @TestDate   DATETIMEOFFSET = TODATETIMEOFFSET(@Now, 0)

SELECT  '@MyDate' Variable,
        @MyDate [Value]
UNION ALL
SELECT  '@TestDate',
        @TestDate

SELECT  SWITCHOFFSET(@MyDate, 0) 'MyDateUTC',
        CASE
            WHEN @MyDate = @TestDate THEN '='
            WHEN @MyDate < @TestDate THEN '<'
            WHEN @MyDate > @TestDate THEN '>'
        END [Is],
        SWITCHOFFSET(@TestDate, 0) 'TestDateUTC'
```