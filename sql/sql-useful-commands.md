# SQL Server

## Useful commands

### Add user as sysadmin

If you find you are missing from the SQL Server `sysadmin` group, and unable to login via _SQL Server Management Studio_ you will need to run the following steps

1. Open Command Prompt as Administrator

2. Stop the SQL Server service

   ```ps
   net stop "SQL Server (MSSQLSERVER)"
   ```

3. Go to the folder that holds the SQL Server executable of the instance you want to add you as administrator. The default for _SQL Server 2017_ is `C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Binn`

4. Start SQL Server in single-user mode (assuming that the instance name is `mssqlserver`)

   ```ps
   sqlservr.exe -s mssqlserver –m
   ```

5. While leaving this window open, open another one (repeating steps 1 and 3)

6. In the second window, open `sqlcmd`

   ```ps
   sqlcmd -s ".\mssqlserver"
   ```

7. In this window, run the following lines (pressing Enter after each one)

   ```sql
   CREATE LOGIN [YOUR_LOCAL_DOMAIN\david.smith] FROM WINDOWS
   GO
   SP_ADDSRVROLEMEMBER 'YOUR_LOCAL_DOMAIN\david.smith','SYSADMIN'
   GO
   ```

8. Use `CTRL + C` to end both windows; you will be prompted to press `Y` to end the SQL Server process.

9. Restart the MSSQL service

### Create a admin user

```sql
CREATE LOGIN [YOUR_DOMAIN\THE_USER] FROM WINDOWS
GO

EXEC master..sp_addsrvrolemember 'YOUR_DOMAIN\YOUR_USERNAME', 'sysadmin'
GO
```

### Lock a table for a given time

```sql
BEGIN TRAN  
SELECT 1 FROM YOUR_TABLE WITH (TABLOCKX)
WAITFOR DELAY '00:02' -- hh:mm[[:ss].mss]
ROLLBACK TRAN
GO
```

### Limit Memory Usage

By default, `SQL Server` is configured to use up all available memory. This will set the max RAM to `4Gb`, which should be more than enough

```sql
EXEC sys.sp_configure
    'show advanced options',
    '1'

RECONFIGURE WITH OVERRIDE
GO

EXEC sys.sp_configure
    N'max server memory (MB)',
    N'4096'
GO

RECONFIGURE WITH OVERRIDE
GO

EXEC sys.sp_configure
    N'show advanced options',
    N'0'

RECONFIGURE WITH OVERRIDE
GO
```

### File size, growth and maximum size

```sql
SELECT   [Name]
        ,FileID
        ,[FileName]
        ,FILEGROUP_NAME(groupid) [FileGroup ]
        ,CONVERT(NVARCHAR(15), CONVERT(BIGINT, Size) * 8) + N' KB' Size
        ,IIF([Status] & 0x100000 = 0x100000, CONVERT(NVARCHAR(15), Growth) + N'%', CONVERT(NVARCHAR(15), CONVERT (BIGINT, growth) * 8) + N'KB') Growth
        ,IIF(MaxSize = -1, N'Unlimited', CONVERT(NVARCHAR(15), CONVERT(BIGINT, MaxSize) * 8) + N'KB') MaxSize
        ,IIF([Status] & 0x40 = 0x40, 'Log only', 'Data only') Usage
from    sysfiles
```
