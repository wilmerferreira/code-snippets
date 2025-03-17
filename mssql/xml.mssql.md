# SQL Server: XML

## Reading

The following sections explains how to read `XML` data, mostly converting `XML` scalar values to result sets.

### query

`query('XQuery')`

### value

`value('XQuery', 'SQLType')`

### exists

`exists('XQuery')`

### modify

- `modify(XML_DML)`

TBC, further information here: [XML Data Modification Language (XML DML)](https://learn.microsoft.com/en-us/sql/t-sql/xml/xml-data-modification-language-xml-dml)

### nodes

- `nodes(XQuery) as Table(Column)`

## ResultSet to XML

Optional options:

- `ROOT('ROOT_NAME')`
- `ELEMENTS`

### AUTO

Returns query results as nested XML elements. This doesn't provide much control over the shape of the XML generated from a query result. The AUTO mode queries are useful if you want to generate simple hierarchies.

Example

```sql
SELECT    schema_id,
          name
FROM      sys.schemas
ORDER BY  name
FOR XML   AUTO,
          ROOT('schemas')
```

Result

```xml
<schemas>
  <sys.schemas schema_id="16385" name="db_accessadmin" />
  <sys.schemas schema_id="16389" name="db_backupoperator" />
  <sys.schemas schema_id="16390" name="db_datareader" />
  <sys.schemas schema_id="16391" name="db_datawriter" />
  <sys.schemas schema_id="16387" name="db_ddladmin" />
  <sys.schemas schema_id="16392" name="db_denydatareader" />
  <sys.schemas schema_id="16393" name="db_denydatawriter" />
  <sys.schemas schema_id="16384" name="db_owner" />
  <sys.schemas schema_id="16386" name="db_securityadmin" />
  <sys.schemas schema_id="1" name="dbo" />
  <sys.schemas schema_id="2" name="guest" />
  <sys.schemas schema_id="3" name="INFORMATION_SCHEMA" />
  <sys.schemas schema_id="4" name="sys" />
</schemas>
```

### EXPLICIT

TBC

### PATH

The `PATH` mode provides a simpler way to mix elements and attributes. `PATH` mode is also a simpler way to introduce more nesting for representing complex properties.

Simple example

```sql
SELECT    s.schema_id '@id', -- Projects the schema_id as an attribute called id
          s.name '@name'
FROM      sys.schemas s
ORDER BY  s.name
FOR XML   PATH('schema'), -- Name of the element
          ROOT('database') -- Name of the root element
```

Output

```xml
<database>
  <schema id="16385" name="db_accessadmin" />
  <schema id="16389" name="db_backupoperator" />
  <schema id="16390" name="db_datareader" />
  <schema id="16391" name="db_datawriter" />
  <schema id="16387" name="db_ddladmin" />
  <schema id="16392" name="db_denydatareader" />
  <schema id="16393" name="db_denydatawriter" />
  <schema id="16384" name="db_owner" />
  <schema id="16386" name="db_securityadmin" />
  <schema id="1" name="dbo" />
  <schema id="2" name="guest" />
  <schema id="3" name="INFORMATION_SCHEMA" />
  <schema id="4" name="sys" />
</database>
```

Children nodes example

```sql
SELECT    s.schema_id '@id',
          s.name '@name',
          (
            SELECT      sv.name '@name'
            FROM        sys.system_views sv
            FOR XML PATH('view'), -- Name of the children element
                        TYPE -- To use the result as a xml type
          ) views -- Name of the children node
FROM      sys.schemas s
ORDER BY  s.name
FOR XML   PATH('schema'), ROOT('database')
```

```xml
<database>
  <!-- More schemas ... -->
  <schema id="3" name="INFORMATION_SCHEMA">
    <views>
      <view name="CHECK_CONSTRAINTS" />
      <view name="COLUMN_DOMAIN_USAGE" />
      <view name="COLUMN_PRIVILEGES" />
      <view name="COLUMNS" />
      <view name="CONSTRAINT_COLUMN_USAGE" />
      <view name="CONSTRAINT_TABLE_USAGE" />
      <view name="DOMAIN_CONSTRAINTS" />
      <view name="DOMAINS" />
      <view name="KEY_COLUMN_USAGE" />
      <view name="PARAMETERS" />
      <view name="REFERENTIAL_CONSTRAINTS" />
      <view name="ROUTINE_COLUMNS" />
      <view name="ROUTINES" />
      <view name="SCHEMATA" />
      <view name="SEQUENCES" />
      <view name="TABLE_CONSTRAINTS" />
      <view name="TABLE_PRIVILEGES" />
      <view name="TABLES" />
      <view name="VIEW_COLUMN_USAGE" />
      <view name="VIEW_TABLE_USAGE" />
      <view name="VIEWS" />
    </views>
  </schemas>
  <!-- More schemas ... -->
</database>
```

### RAW

Transforms each row in the query result set into an XML element that has the generic identifier `<row>`, or the optionally provided element name. By default, each column value in the rowset that is not NULL is mapped to an attribute of the `<row>` element. If the ELEMENTS directive is added to the FOR XML clause, each column value is mapped to a sub-element of the `<row>` element.

## More Information

- [xml Data Type Methods - Microsoft Learn](https://learn.microsoft.com/en-us/sql/t-sql/xml/xml-data-type-methods)
