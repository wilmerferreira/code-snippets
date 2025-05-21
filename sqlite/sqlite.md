# SQLite

## Docker

Since _SQLite_ is a lightweight, file-based database, it doesn't need Docker like MySQL or MongoDB.

## IDEs

- [DbVisualizer](https://www.dbvis.com)

  ```sh
  winget install DBVis.DBVisualizer
  ```

- [DBeaver](https://dbeaver.io/)
- [DataGrip](https://www.jetbrains.com/datagrip/)

## .NET Example

1. Install the Nuget Package [System.Data.SQLite.Core](https://www.nuget.org/packages/System.Data.SQLite.Core) in your project

   ```sh
   dotnet add package System.Data.SQLite.Core
   ```

2. Add the following _using_

   ```cs
   using System.Data.SQLite;
   ```

3. Example

   ```cs
   var connectionString = new SQLiteConnectionStringBuilder
   {
     DataSource = "database.sqlite",
     Version = 3
   };
   
   using (var connection = new SQLiteConnection(connectionString.ToString()))
   {
     connection.Open();

     using (var command = new SQLiteCommand("SELECT sqlite_version() AS version, datetime('now') AS db_datetime;", connection))
     using (var reader = command.ExecuteReader())
     {
       while (reader.Read())
       {
         Console.WriteLine($"SQLite Version: {reader["version"]}");
         Console.WriteLine($"Database Date-Time: {reader["db_datetime"]}");
       }
     }
   }
   ```

## More Information

- [MySQL Docs](https://dev.mysql.com/doc/)
  - [Data Manipulation Statements](https://dev.mysql.com/doc/refman/8.4/en/sql-data-manipulation-statements.html)
