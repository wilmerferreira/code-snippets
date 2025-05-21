# MariaDB

## Docker

This uses the [official image from docker hub](https://hub.docker.com/_/mysql)

```sh
docker run --name mariadb -e MARIADB_ROOT_PASSWORD=YourStrongPassword -p 3306:3306 -d --restart always mariadb
```

## IDEs

> Use the same IDEs supported by MySQL

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
     Console.WriteLine("Connected to MySQL Database!");
   
     using (var command = new MySqlCommand("SELECT VERSION() AS version, NOW() AS db_datetime;", connection))
     using (MySqlDataReader reader = command.ExecuteReader())
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

- [MariaDB Documentation](https://mariadb.com/docs/)
  - [SQL Reference](https://mariadb.com/docs/server/sql/)
