# Microsoft SQL Server

## Docker

This uses the [official microsoft image for sql server from docker hub](https://hub.docker.com/r/microsoft/mssql-server/)

```sh
docker run --name "sql-server-2022" -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@ssw0rd!" -p 1433:1433 -d --restart always mcr.microsoft.com/mssql/server:2022-latest
```

## SQL Server Management Studio

```ps1
winget install Microsoft.SQLServerManagementStudio
```
