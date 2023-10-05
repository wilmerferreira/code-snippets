# PowerShell: Machine Information

The main cmdlet used for this is `Get-WmiObject`, which can be also used as `gwmi` (alias)

```ps1
# Get basic information
gwmi Win32_OperatingSystem

# Get extended information
Get-WmiObject Win32_OperatingSystem | Select * | FL

# Get the OS Version
(Get-WmiObject Win32_OperatingSystem).Version

Get-WmiObject Win32_OperatingSystem `
    | Select PSComputerName, Caption, OSArchitecture, Version, BuildNumber `
    | Format-List

# Using the System.Environment .NET class
[System.Environment]::OSVersion
```
