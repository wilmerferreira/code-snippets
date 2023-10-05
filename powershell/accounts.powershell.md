# PowerShell: Accounts

## Local Accounts

This is supported from PowerShell 5.1

- List local groups

```ps1
Get-LocalGroup | sort
```

- List group members

```ps1
Get-LocalGroupMember -Group "Administrators"
```

## Active Directory

1. Install Remote Server Administration Tools
   - Windows 10 (not supported in Home or Standard editions)
     - Windows 10 October 2018 Update or later: Starting with Windows 10 October 2018 Update, RSAT is included as a set of "Features on Demand" right from Windows 10. **Do not download an RSAT package**.

       ```ps1
       Add-WindowsCapability -Name "Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0" -Online
       ```

2. Open a PowerShell session as administrator
3. Import `ActiveDirectory` module

   ```ps1
   #Requires -RunAsAdministrator

   Add-WindowsCapability -Online -Name "Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0"

   Import-Module ActiveDirectory
   ```

4. Execute any command included in that module

   ```ps1
   # Get first 10 users
   Get-ADUser -Filter * | Select Name, USerPrincipalName -First 10 | ft
   
   # Get 10 groups
   Get-ADGroup -Filter * | Select SID, Name, GroupCategory -First 10 | ft

   # Get user details by username
   Get-ADUser -Identity david.smith -Properties *
   
   # Get user details by email
   Get-ADUser -Filter 'EmailAddress -eq "david.smith@company.com"' -Properties *

   # Get all the user details
   Get-ADUser -Identity david.smith -Properties * | Format-List

   # Get specific user details
   Get-ADUser -Identity david.smith -Properties DisplayName, UserPrincipalName, PasswordNotRequired, PasswordLastSet, CannotChangePassword, PasswordNeverExpires, PasswordExpired, LockedOut, Enabled, Created, Modified | Select SID, DisplayName, UserPrincipalName, PasswordNotRequired, PasswordLastSet, CannotChangePassword, PasswordNeverExpires, PasswordExpired, LockedOut, Enabled, Created, Modified | Format-Table

   # Get user's group membership
   Get-ADPrincipalGroupMembership david.smith | Where-Object { $_.GroupCategory -eq "Security" } | Select-Object Name | Sort-Object Name | Format-Table
   ```

### More Information

- [MSDN: Local Accounts](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.localaccounts/?view=powershell-5.1)
- [MSDN: Active Directory](https://docs.microsoft.com/en-us/powershell/module/addsadministration/?view=win10-ps)
- [Remote server administration tools (RSAT)](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/features-on-demand-non-language-fod#remote-server-administration-tools-rsat)
- [Using DISM /add-capability to add or remove FODs](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/features-on-demand-v2--capabilities#using-dism-add-capability-to-add-or-remove-fods)
