# Oracle

## Docker

This uses the [official Oracle's image for the Oracle Database (Express Edition) from docker hub](https://hub.docker.com/r/microsoft/mssql-server/)

```sh
docker run -d --name oracle -p 1521:1521 -p 5500:5500 -e ORACLE_PWD=YourStrongPassword -e ORACLE_CHARACTERSET=AL32UTF8 container-registry.oracle.com/database/express:latest
```

> The Oracle XE container may take a couple of minutes to initialize before connections are allowed.

## IDEs

- [Oracle SQL Developer](https://www.oracle.com/database/sqldeveloper/)
- [DBeaver](https://dbeaver.io/)
- [DataGrip](https://www.jetbrains.com/datagrip/)
- [Toad for Oracle](https://www.quest.com/products/toad-for-oracle/)
- [Navicat for Oracle](https://www.navicat.com/en/products/navicat-for-oracle)
- [PL/SQL Developer](https://www.allroundautomations.com/products/pl-sql-developer/)
- [dbForge Studio for Oracle](https://www.devart.com/dbforge/oracle/studio/)

## .NET Example

1. Install the Nuget Package [Oracle.ManagedDataAccess.Core](https://www.nuget.org/packages/Oracle.ManagedDataAccess.Core) in your project

   ```sh
   dotnet add package Oracle.ManagedDataAccess.Core
   ```

2. Add the following _using_

   ```cs
   using Oracle.ManagedDataAccess.Client;
   ```

3. Example

   ```cs
   var connectionString = new OracleConnectionStringBuilder();
   connectionString.UserID = "SYSTEM";
   connectionString.Password = "YourStrongPassword";
   connectionString.DataSource = "localhost:1521/XEPDB1";

   using (var connection = new OracleConnection(connectionString.ToString()))
   {
     connection.Open();

     using (var command = new OracleCommand("SELECT 'Hello' AS MESSAGE FROM DUAL", connection))
     using (var reader = command.ExecuteReader())
     {
       while (reader.Read())
       {
         Console.WriteLine(reader["MESSAGE"]);
       }
     }
   }
   ```

## More Information

- [Oracle Help Center](https://docs.oracle.com/en/)
