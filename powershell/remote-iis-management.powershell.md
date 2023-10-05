# PowerShell: Remote IIS Management

## Using IIS Manager

### Configure server

1. Check if _IIS_ is installed

   ```ps1
   # Windows 8+, Windows Server 2012+
   Get-WindowsOptionalFeature -FeatureName IIS-WebServer -Online

   # Windows Server 2008
   Get-WindowsFeature -Name Web-Server | Format-List
   ```

2. Enable the _Management Service_

   ```ps1
   # Windows 8+, Windows Server 2012+
   Get-WindowsOptionalFeature -FeatureName IIS-ManagementService -Online
   Enable-WindowsOptionalFeature -FeatureName IIS-ManagementService -Online

   # Windows Server 2008
   Get-WindowsFeature -Name Web-Mgmt-Service | Select *
   Add-WindowsFeature -Name Web-Mgmt-Service
   ```

3. Enable _Remote Management_

   ```ps1
   Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WebManagement\Server -Name EnableRemoteManagement
   Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WebManagement\Server -Name EnableRemoteManagement -Value 1
   ```

4. Change the startup type of the _Web Management Service_

   ```ps1
   Set-Service WMSVC -StartupType Automatic
   Start-service WMSVC
   ```

5. Make sure that the port `8172` is open?

### Configure local machine

1. Install the _IIS Management Console_

   ```ps1
   # Windows 8+
   Enable-WindowsOptionalFeature -FeatureName IIS-ManagementConsole -Online
   ```

2. Download and install the [IIS Manager for Remote Administration 1.2](https://www.microsoft.com/en-us/download/details.aspx?id=41177)

   ```ps1
   Invoke-WebRequest -Uri https://download.microsoft.com/download/2/4/3/24374C5F-95A3-41D5-B1DF-34D98FF610A3/inetmgr_amd64_en-US.msi -OutFile setup.msi
   ```

## Using IIS Management API

TBC

## More Information

- [Different ways for installing Windows features on the command line](https://hahndorf.eu/blog/WindowsFeatureViaCmd.html)
- [Enabling IIS Remote Management Using PowerShell](https://mcpmag.com/articles/2014/10/21/enabling-iis-remote-management.aspx)
- [Remote Administration for IIS Manager: Configure WMSVC Settings](https://docs.microsoft.com/en-us/iis/manage/remote-administration/remote-administration-for-iis-manager#configure-wmsvc-settings)
