# SQL Server - Change Tracking

1. Check if database **compatibility_level** is set to 90 or greater (if It is lower than 90, then change tracking will not work) and the **snapshot_isolation_state** (it should be "1").

   ```sql
   SELECT  compatibility_level, snapshot_isolation_state
   FROM    sys.databases WHERE name = 'Sandbox';
   ```

2. Enable Isolation level on a database to Snapshot. It will ensure change tracking information is consistent.

     ```sql
     ALTER DATABASE Sandbox SET ALLOW_SNAPSHOT_ISOLATION ON
     ```

3. Enable the change tracking feature in the database

   ```sql
   ALTER DATABASE YOUR_DATABASE
   SET CHANGE_TRACKING = ON
   (CHANGE_RETENTION = 2 DAYS, AUTO_CLEANUP = ON)
   ```

   - `CHANGE_RETENTION`: It specifies the time period for which change tracking information is kept.
   - `AUTO_CLEANUP`: It enables or disables the cleanup task that removes old change tracking information.

4. Enable a table to be tracked

   ```sql
   ALTER TABLE YOUR_SCHEMA.YOUR_TABLE
   ENABLE CHANGE_TRACKING  
   WITH (TRACK_COLUMNS_UPDATED = ON)  
   ```

   - `TRACK_COLUMNS_UPDATED`: Setting value to `ON` will make SQL Server Engine store extra information about columns which are enabled for change tracking. `OFF` is default value to avoid extra overhead on SQL Server to maintain extra columns information.

   [More Information](https://docs.microsoft.com/en-us/sql/relational-databases/track-changes/enable-and-disable-change-tracking-sql-server)

5. Query the changes

   ```sql
   SELECT   ct.*
   FROM     CHANGETABLE(CHANGES schema_name.table_name, 0) ct
   ```

## System views

## Functions

- `CHANGETABLE(CHANGES)` or `CHANGETABLE(VERSION)`, this is a table function and returns the following columns:

  - `SYS_CHANGE_VERSION`
  - `SYS_CHANGE_CREATION_VERSION`
  - `SYS_CHANGE_OPERATION`
  - `SYS_CHANGE_COLUMNS`
  - `SYS_CHANGE_CONTEXT`
  - All the _primary key_ columns

- `CHANGE_TRACKING_MIN_VALID_VERSION`
- `CHANGE_TRACKING_CURRENT_VERSION`
- `CHANGE_TRACKING_IS_COLUMN_IN_MASK`

## Useful queries

- List the databases with change tracking enabled

  ```sql
  SELECT  ctdb.database_id,
          db.[name],
          ctdb.is_auto_cleanup_on,
          ctdb.retention_period,
          ctdb.retention_period_units,
          ctdb.retention_period_units_desc,
          ctdb.max_cleanup_version
  FROM    sys.change_tracking_databases ctdb
  JOIN    sys.databases db
      ON  db.database_id = ctdb.database_id
  ```

- List tracked tables

  ```sql
  SELECT    s.name [schema],
            t.name [table],
            ct.is_track_columns_updated_on,
            ct.min_valid_version,
            ct.begin_version,
            ct.cleanup_version
  FROM      sys.change_tracking_tables ct
  JOIN      sys.tables t
      ON    t.object_id = ct.object_id
  JOIN      sys.schemas s
      ON    t.schema_id = s.schema_id
  ORDER BY  s.name,
            t.name
  ```

- List all tables with/without change tracking

    ```sql
    SELECT      s.name [schema],
                t.name [table],
                ct.is_track_columns_updated_on,
                ct.min_valid_version,
                ct.begin_version,
                ct.cleanup_version
    FROM        sys.tables t
    JOIN        sys.schemas s
        ON      s.schema_id = t.schema_id
    LEFT JOIN   sys.change_tracking_tables ct
        ON      t.object_id = ct.object_id
    ORDER BY    s.name,
                t.name
    ```

- Enable column tracking

  ```sql
  ALTER TABLE dbo.FlightSector
  DISABLE CHANGE_TRACKING
  GO

  ALTER TABLE dbo.FlightSector
  ENABLE CHANGE_TRACKING
  WITH (TRACK_COLUMNS_UPDATED = ON)
  GO
  ```

- Retrieve the committed datetime

  ```sql
  SELECT  ct.*,
          tct.commit_time
  FROM    CHANGETABLE(CHANGES schema_name.table_name, 0) CT
  JOIN    sys.dm_tran_commit_table tct
      ON  ct.sys_change_version = tct.commit_ts
  ```

- Affected rows per transaction

  ```sql
  SELECT      ct.SYS_CHANGE_VERSION,
              COUNT(*) RowsAffected,
              tct.commit_time
  FROM        CHANGETABLE(CHANGES schema_name.table_name, 0) CT
  JOIN        sys.dm_tran_commit_table tct
      ON      ct.sys_change_version = tct.commit_ts
  GROUP BY    ct.SYS_CHANGE_VERSION,
              tct.commit_time
  ORDER BY    ct.SYS_CHANGE_VERSION
  ```
