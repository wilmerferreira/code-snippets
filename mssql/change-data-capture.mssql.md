# SQL Server: Change Data Capture

## Steps

1. Enable and start the **SQL Server Agent**

2. Enable *cdc* in a specified database

   ```sql
   EXECUTE sys.sp_cdc_enable_db -- Execute this command in the required database
   ```

   This will create the following system tables

   - `cdc.captured_columns`
   - `cdc.change_tables`
   - `cdc.ddl_history`
   - `cdc.index_columns`
   - `cdc.lsn_time_mapping`
   - `dbo.systranschemas`

3. Check that cdc is actually enabled in the database.

   ```sql
   SELECT  [name], database_id, is_cdc_enabled
   FROM    sys.databases
   ```

4. Add a table to be tracked by cdc.

   ```sql
   EXECUTE sys.sp_cdc_enable_table
           @source_schema = N'dbo',
           @source_name = N'CDC_DEMO_TABLE1',
           @role_name = NULL
   ```

   - This will create a system table on the `cdc` schema with the following format: `cdc.<schema>_<table>_CT`, e.g. `cdc.dbo_CDC_DEMO_TABLE1_CT`
   - By default, all the columns of the specified table are taken into consideration of this operation. Set the `@captured_column_list` if you want to only few columns of this table to be tracked.

## Functions

- `cdc.fn_cdc_get_all_changes_<capture_instance>`
- `sys.fn_cdc_has_column_changed`
- `cdc.fn_cdc_get_net_changes_<capture_instance>`
- `sys.fn_cdc_increment_lsn`
- `sys.fn_cdc_decrement_lsn`
- `sys.fn_cdc_is_bit_set`
- `sys.fn_cdc_get_column_ordinal`
- `sys.fn_cdc_map_lsn_to_time`
- `sys.fn_cdc_get_max_lsn`
- `sys.fn_cdc_map_time_to_lsn`
- `sys.fn_cdc_get_min_lsn`

[More information](https://docs.microsoft.com/en-us/sql/relational-databases/system-functions/change-data-capture-functions-transact-sql)

## Stored Procedures

- `sys.sp_cdc_add_job`
- `sys.sp_cdc_generate_wrapper_function`
- `sys.sp_cdc_change_job`
- `sys.sp_cdc_get_captured_columns`
- `sys.sp_cdc_cleanup_change_table`	
- `sys.sp_cdc_get_ddl_history`
- `sys.sp_cdc_disable_db`
- `sys.sp_cdc_help_change_data_capture`
- `sys.sp_cdc_disable_table`
- `sys.sp_cdc_help_jobs`
- `sys.sp_cdc_drop_job`
- `sys.sp_cdc_scan`
- `sys.sp_cdc_enable_db`
- `sys.sp_cdc_start_job`
- `sys.sp_cdc_enable_table`
- `sys.sp_cdc_stop_job`

## References

- [Change Data Capture in SQL Server](https://www.c-sharpcorner.com/UploadFile/db2972/change-data-capture-in-sql-server)