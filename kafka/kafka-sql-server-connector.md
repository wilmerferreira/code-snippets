# Kafka: SQL Server Connector

## Configure _Kafka Connect JDBC_ to work with SQL Server

1. Download the [SQL Server driver for JDBC](https://docs.microsoft.com/en-us/sql/connect/jdbc/download-microsoft-jdbc-driver-for-sql-server)
2. Extract the downloaded file and copy the correct file (e.g. `mssql-jdbc-6.4.0.jre8.jar`) to `<platform_path>\share\java\kafka-connect-jdbc\`

### Connector Setup

- JDBC Url: `jdbc:sqlserver://localhost:1433;databaseName=CDC_DEMO`
- JDBC User: `kafka`
- JDBC Password: `kafka`
- Table Whitelist: `<table_name>`

### Loading modes

- **bulk**: performs a bulk load of the entire table ech time it is pulled.
- **incrementing**: use a strictly incrementing column on each table to detect only new rows (this will not detect modifications or deletions of existing rows).
- **timestamp**: use a timestamp (or timestamp-like) column to detect new and modified rows. This assumes the column is updated with each write, and that values are monotonically incrementing, but not necessarily unique.
- **timestamp+incrementing**: use two columns, a timestamp column that detects new and modified rows and a strictly incremening column which provides a globally unique ID for updates so each row can be assigned a unique stream offset.

### Configure _Kafka Connect CDC Microsoft SQL_

1. Download the [Kafka Connect CDC Microsoft SQL](https://www.confluent.io/connector/kafka-connect-cdc-microsoft-sql/) connector
2. Extract the downloaded file and copy the following files:
   - `<extracted_folder>\confluentinc-kafka-connect-cdc-mssql-1.0.0-preview\doc\*` to `<platform_path>\share\doc\kafka-connect-cdc-mssql\`
   - `<extracted_folder>\confluentinc-kafka-connect-cdc-mssql-1.0.0-preview\etc\*` to `<platform_path>\etc\kafka-connect-cdc-mssql`
   - `<extracted_folder>\confluentinc-kafka-connect-cdc-mssql-1.0.0-preview\lib\*` to `<platform_path>\share\java\kafka-connect-cdc-mssql\`

## Examples

```json
{
  "connector.class": "io.confluent.connect.jdbc.JdbcSourceConnector",
  "name": "SQLServer.localhost.Sandbox.Customers (JDBC)",
  "connection.url": "jdbc:sqlserver://localhost:1433;databaseName=Sandbox",
  "connection.user": "kafka",
  "connection.password": "****",
  "table.whitelist": "Customer",
  "mode": "bulk",
  "topic.prefix": "SQLServer.localhost.Sandbox.",
  "numeric.mapping": "best_fit"
}
```

```sql
USE CDC_DEMO
GO

DECLARE @begin_time DATETIME,
        @end_time   DATETIME,
        @begin_lsn  BINARY(10),
        @end_lsn    BINARY(10),
        @min_lsn    BINARY(10),
        @max_lsn    BINARY(10);

SELECT  @begin_time = '2018-07-05', --GETDATE() - 5,
        @end_time = '2018-07-05 12:00:00.000', --GETDATE() - 4,
        @begin_lsn = sys.fn_cdc_map_time_to_lsn('smallest greater than', @begin_time),
        @end_lsn = sys.fn_cdc_map_time_to_lsn('largest less than or equal', @end_time),
        @min_lsn = sys.fn_cdc_get_min_lsn('dbo_CDC_DEMO_TABLE1'),
        @max_lsn = sys.fn_cdc_get_max_lsn();

SELECT  @begin_time '@begin_time',
        @end_time '@end_time',
        @begin_lsn '@begin_lsn',
        @end_lsn '@end_lsn',
        @min_lsn '@min_lsn',
        @max_lsn '@max_lsn'

SELECT * FROM cdc.fn_cdc_get_all_changes_dbo_CDC_DEMO_TABLE1(@begin_lsn, @end_lsn, 'all')
SELECT * FROM cdc.fn_cdc_get_all_changes_dbo_CDC_DEMO_TABLE1(@min_lsn, @max_lsn, 'all')
```
