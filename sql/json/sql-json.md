# SQL Server

## [JSON](https://docs.microsoft.com/en-us/sql/relational-databases/json/json-data-sql-server)

### Functions

- `ISJSON`: tests whether a string contains valid JSON.
- `JSON_VALUE`: extracts a scalar value from a JSON string.
- `JSON_QUERY`: extracts an object or an array from a JSON string.
- `JSON_MODIFY`: changes a value in a JSON string.

### Output options

- `ROOT`: To add a single, top-level element to the JSON output, specify the ROOT option. If you don't specify this option, the JSON output doesn't have a root element. For more info, see Add a Root Node to JSON Output with the ROOT Option (SQL Server).

- `INCLUDE_NULL_VALUES`: To include null values in the JSON output, specify the INCLUDE_NULL_VALUES option. If you don't specify this option, the output doesn't include JSON properties for NULL values in the query results. For more info, see Include Null Values in JSON Output with the INCLUDE_NULL_VALUES Option (SQL Server).

- `WITHOUT_ARRAY_WRAPPER`: To remove the square brackets that surround the JSON output of the FOR JSON clause by default, specify the WITHOUT_ARRAY_WRAPPER option. Use this option to generate a single JSON object as output from a single-row result. If you don't specify this option, the JSON output is formatted as an array - that is, it's enclosed within square brackets. For more info, see Remove Square Brackets from JSON Output with the WITHOUT_ARRAY_WRAPPER Option (SQL Server).

### Reference

- [Solve common issues with JSON in SQL Server](https://docs.microsoft.com/en-us/sql/relational-databases/json/solve-common-issues-with-json-in-sql-server)
