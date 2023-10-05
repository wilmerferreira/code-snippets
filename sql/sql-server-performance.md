# SQL Server: Performance

- Table scan
- Table seek
- Index scan
- Index seek
- Key Lookup
- RID Lookup
- Nested loops
- Merge join
- Hash match
- Sort
  - orders data
    - order by
    - Ranking functions (row_number, etc)
    - Merge join
  - Is a blocking operator
  - Can be expensive (big input rows could be necessary to use the `tempdb`)
- Constant scan

Table variables <~ 1000 else temp tables

SET STATISTICS IO ON

> Tune the query, don't tune the plan

Tools

- SQL Sentry plan explorer
- SQL Server Execution Plans
- Inside the SQL Server Query Optimizer
