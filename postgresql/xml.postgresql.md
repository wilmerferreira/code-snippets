# PostgreSQL: XML

## Object to XML

Basic functions:

- `schema_to_xml()`
- `schema_to_xmlschema()`
- `schema_to_xml_and_xmlschema()`
- `database_to_xml()`
- `database_to_xmlschema()`
- `database_to_xml_and_xmlschema()`
- `table_to_xml()`
- `table_to_xml_and_xmlschema()`
- `query_to_xml()`
- `query_to_xml_and_xmlschema()`

```sql
-- Query to xml
select query_to_xml('
  select      namespaces.nspname schema_name,
              classes.relname table_name,
              attributes.attname column_name
  from        pg_namespace namespaces
  join        pg_class classes
      on      classes.relnamespace = namespaces.oid
  join        pg_attribute attributes
      on      attributes.attrelid = classes.oid
      and     attributes.attnum > 0
      and     attributes.attisdropped = false
  order by    namespaces.nspname,
              classes.relname,
              attributes.attnum', true, false, '');
```

Individual functions:

- `xmltext()`
- `xmlcomment()`
- `xmlconcat()`
- `xmlelement()`
- `xmlattributes()`
- `xmlforest()`
- `xmlroot()`
- `xmlagg()`

```sql
-- Custom result, this returns a row per each element generated
select    xmlelement(
            name table,
            xmlattributes(
              namespaces.nspname  as schema,
              classes.relname as name
            )
          ) as xml_content
from      pg_namespace namespaces
join      pg_class classes
  on      classes.relnamespace = namespaces.oid
where     classes.relkind in ('r', 'p') -- filters for standard and partitioned tables
order by  namespaces.nspname,
          classes.relname;

-- Same but with a wrapper (root) element
select    xmlelement(
            name "database",
            xmlagg(
              xmlelement(
                name "table",
                xmlattributes(
                   namespaces.nspname as "schema",
                   classes.relname as "name"
               )
              ) order by namespaces.nspname, classes.relname
            )
          ) as database_xml
from      pg_namespace namespaces
join      pg_class classes
  on      classes.relnamespace = namespaces.oid
where     classes.relkind in ('r', 'p');

-- Complex example
with table_nodes as (
  select    xmlelement(
              name "table",
              xmlattributes(
                namespaces.nspname as "namespace",
                classes.relname as "name"
              ),
              xmlagg(
                xmlelement(
                  name "column",
                  xmlattributes(attributes.attname as "name")
                ) order by attributes.attnum
              )
            ) as table_xml,
            namespaces.nspname,
            classes.relname
  from      pg_namespace namespaces
  join      pg_class classes
    on      classes.relnamespace = namespaces.oid
  join      pg_attribute attributes
    on      attributes.attrelid = classes.oid
    and     attributes.attnum > 0
    and     attributes.attisdropped = false
  group by  namespaces.nspname,
            classes.relname,
            classes.oid
)
select  xmlelement(
          name "database",
          xmlagg(table_xml order by nspname, relname)
        ) as xml_content
from    table_nodes;
```

## XML to Object

Functions:

- `xml_is_well_formed()`
- `xml_is_well_formed_document()`
- `xml_is_well_formed_content()`
- `xpath()`
- `xpath_exists()`
- `xmlexists()`

**TODO: Add examples**

## More Information

- [XML Functions](https://www.postgresql.org/docs/current/functions-xml.html)
