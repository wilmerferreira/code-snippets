# DB2

## Docker

This uses the [official image from docker hub](https://hub.docker.com/_/mysql)

```sh
docker run --name db2 -e DB2INSTANCE=db2inst1 -e DB2INST1_PASSWORD=YourStrongPassword -e DBNAME=TESTDB -e LICENSE=accept -e PERSISTENT_HOME=false -p 50000:50000 -d --privileged=true --restart=always icr.io/db2_community/db2
```

## IDEs

- [DBeaver](https://dbeaver.io/)
- [DataGrip](https://www.jetbrains.com/datagrip/)
- [DbVisualizer](https://www.dbvis.com)

## .NET Example

1. Install the Nuget Package [Net.IBM.Data.Db2](https://www.nuget.org/packages/Net.IBM.Data.Db2) in your project

   ```sh
   dotnet add package Net.IBM.Data.Db2
   ```

2. Add the following _using_

   ```cs
   using MySql.Data.MySqlClient;
   ```

3. Example

   ```cs
   var connectionString = new DB2ConnectionStringBuilder
   {
     Server = "localhost",
     UserID = "db2inst1",
     Password = "YourStrongPassword",
     Database = "TESTDB"
   };

   using (var connection = new DB2Connection(connectionString.ToString()))
   {
     connection.Open();

     string query = "SELECT SERVICE_LEVEL AS version, CURRENT TIMESTAMP AS db_datetime FROM SYSIBMADM.ENV_INST_INFO;";

     using (var cmd = new DB2Command(query, connection))
     using (var reader = cmd.ExecuteReader())
     {
       while (reader.Read())
       {
         Console.WriteLine($"Db2 Version: {reader["version"]}");
         Console.WriteLine($"Database Date-Time: {reader["db_datetime"]}");
       }
     }
   }
   ```

## More Information

- [IBM Db2 for Linux, UNIX and Windows documentation](https://www.ibm.com/docs/en/db2)
  - [Installing the Db2 Community Edition Docker image on Windows systems](https://www.ibm.com/docs/en/db2/11.5.x?topic=system-windows)
  - [SQL: The language of Db2](https://www.ibm.com/docs/en/db2-for-zos/12.0.0?topic=db2-sql)
