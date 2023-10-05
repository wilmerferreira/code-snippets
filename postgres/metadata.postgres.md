# PostgreSQL: Metadata

- Fetching tables and columns

  ```sql
  -- Using information_schema
  SELECT      t.table_schema schema_name,
              t.table_name table_name,
              c.column_name,
              c.data_type,
              c.character_maximum_length,
              c.is_nullable,
              c.column_default,
              c.is_identity
  FROM        information_schema.tables t
  JOIN        information_schema.columns c
      ON      t.table_catalog = c.table_catalog
      AND     t.table_schema = c.table_schema
      AND     t.table_name = c.table_name
  ORDER BY    t.table_schema,
              t.table_name,
              c.ordinal_position

  -- Using native system tables/views
  select  namespaces.nspname schema_name,
          classes.relname table_name,
          attributes.attname column_name
  from    pg_namespace namespaces
  join    pg_class classes
      on  classes.relnamespace = namespaces.oid
  join    pg_attribute attributes
      on  attributes.attrelid = classes.oid
      and attributes.attnum > 0
      and attributes.attisdropped = false
  order by namespaces.nspname,
           classes.relname,
           attributes.attnum
  ```
