# Microsoft SQL Server

## Docker

This uses the [official image from docker hub](https://hub.docker.com/r/microsoft/mssql-server/)

```sh
docker run --name "sql-server-2022" -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@ssw0rd!" -p 1433:1433 -d --restart always mcr.microsoft.com/mssql/server:2022-latest
```

## IDEs

- [SQL Server Management Studio](https://learn.microsoft.com/en-us/ssms/install/install) (official IDE)

  ```ps1
  winget install Microsoft.SQLServerManagementStudio
  ```

- [DBeaver](https://dbeaver.io/)
- [DataGrip](https://www.jetbrains.com/datagrip/)
