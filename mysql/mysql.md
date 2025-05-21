# MySQL

## Docker

This uses the [official image from docker hub](https://hub.docker.com/_/mysql)

```sh
docker run --name mysql -e MYSQL_ROOT_PASSWORD=YourStrongPassword -p 3306:3306 -d --restart always mysql
```

## IDEs

- [MySQL Workbench](https://www.mysql.com/products/workbench/) (official IDE)
- [DBeaver](https://dbeaver.io/)
- [HeidiSQL](https://www.heidisql.com/download.php)
- [Toad Edge for MySQL](https://www.quest.com/products/toad-edge/)
- [SQLyog Community Edition](https://github.com/webyog/sqlyog-community/wiki/Downloads/)
- [Navicat for MySQL](https://www.navicat.com/en/products/navicat-for-mysql)
- [Aqua Data Studio](https://aquadatastudio.com/products/)
- [DataGrip](https://www.jetbrains.com/datagrip/)

## .NET Example

1. Install the Nuget Package [MySql.Data](https://www.nuget.org/packages/MySql.Data/) in your project

   ```sh
   dotnet add package MySql.Data
   ```

2. Add the following _using_

   ```cs
   using MySql.Data.MySqlClient;
   ```

3. Example

   ```cs
   var connectionString = new MySqlConnectionStringBuilder
   {
     Server = "localhost",
     Port = 3306,
     UserID = "root",
     Password = "YourStrongPassword"
   };

   using (var connection = new MySqlConnection(connectionString.ToString()))
   {
     connection.Open();
   
     using (var command = new MySqlCommand("SELECT VERSION() AS version, NOW() AS db_datetime;", connection))
     using (var reader = command.ExecuteReader())
     {
       while (reader.Read())
       {
         Console.WriteLine($"MySQL Version: {reader["version"]}");
         Console.WriteLine($"Database Date-Time: {reader["db_datetime"]}");
       }
     }
   }
   ```

## More Information

- [MySQL Docs](https://dev.mysql.com/doc/)
  - [Data Manipulation Statements](https://dev.mysql.com/doc/refman/8.4/en/sql-data-manipulation-statements.html)
