# Powershell

## History

[About Command History](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_history)

## Verbs

```ps1
# List verbs
Get-Verb
```

[More information about Approved Verbs](https://docs.microsoft.com/en-us/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands)

## Nouns

- `Help`
- `Command`
- `Service`
- `Computer`
- `Location`
- `ChildItems`

Use the following command to find available commands by noun

```ps1
# Lists all the available commands for the Certificate noun
Get-Command -Noun Certificate
```

## Comments

- Line comment

  ```ps1
  # My comment here
  ```

  ```ps1
  Set-Location "c:\" # This is a comment after a command
  ```

- Multiline comment

  ```ps1
  <#
    My
    multiline
    comment
    here
  #>
  ```

- Region comment

  ```ps1
  # region Region name here
  ...
  ...
  ...
  # endregion
  ```

## Commands lets (Cmdlets)

The convention for commands lets is `[Verb-Noun] [-switch]`

- `Get-Command`

   ```ps1
   Get-Command -verb "get"
   Get-Command -noun "service"
   ```

- `Get-Help`: to view help about a command

   ```ps1
   Get-Help Get-Command
   Get-Help Get-Command -examples
   Get-Help Get-Command -detailed
   Get-Help Get-Command -full
   Get-Help Get-Command -online # Since powershell v3
   Get-Command -?
   ```

- `Get-Alias`: to see the unix/linux alias to windows commands.
- `Set-Alias [alias] => command` only works in the current execution.
- `Export-Alias [path].csv [filter]`
- `Import-Alias [path].csv`
- `Get-ChildItem` equivalent to dir command
- `Set-Location` equivalent to cd command
- `Clear host` Clear the powershell terminal

## Aliases

- `Get-Alias` list all of the aliases
- `dir`
- `Get-Alias rm` displays the alias definition of `rm`

LS alias

```ps1
# Get the alias definition
Get-Alias ls

# Get the aliases pointing to Get-ChildItem
Get-Alias -definition Get-ChildItem
```

## Variables

```ps1
New-Variable -Name var -Value 33
Get-Variable var -ValueOnly
Get-Variable var
Set-Variable -Name var -Value "New value"
Clear-Variable -Name var
Remove-Variable -Name var
```

## Build-in Variables

```ps1
$NULL
$true
$false
```

```ps1
# working directory
$pwd

# User's home directory
$home

# Info about a users scripting environment
$host

# Process ID
$pid

# powershell version
$PSVersionTable
```

## Providers and drives

```ps1
# List providers
Get-PSProvider

# List drives
Get-PSDrive
```

```ps1
#Create a drive
New-PSDrive -Name docs -PSProvider FileSystem -Root 'c:\Users\david.smith\Desktop'

# Go to the new drive
Set-Location docs:

# Get the elements in that drive
Get-ChildItem

# Remove a drive (you need to move out the drive first)
Set-Location c:
Remove-PSDrive docs
```

## Strings

```ps1
# Creating a string variable
$myText = 'Something Tabbed'

# String variable with escape character
$myText = "`tSomething Tabbed"

# Escape characters just works with with double quotes
$myText = "Something `nElse"

# Multiline string variable
$myText = @"Multiline
string
"@ # Needs to be separated from the content

# String interpolation
$items = (Get-ChildItem).Count
$loc = Get-Location "There are $items items in the folder $loc"

# String expressions
Write-Host "There are $((Get-ChildItem).Count) items in the folder $(Get-Location)"
Write-Host "Today is $(Get-Date). Be well."

# String format
$items = (Get-ChildItem).Count
[string]::Format("There are {0} items.", $items )
"There are {0} items." -f $items
"My salary is {0:n2} pounds." -f 1234.5678
```

## Conditions & Operators

- Basic operators

  > default, case-sensitive and case-insensitive

  | Operator          | Example               |
  |-------------------|-----------------------|
  | Equals            | `-eq` `-ceq` `-ieq`   |
  | Not equal         | `-ne` `-cne` `-ine`   |
  | Greater than      | `-gt` `-cgt` `-igt`   |
  | Greater equal to  | `-ge` `-cge` `-ige`   |
  | Less than         | `-lt` `-clt` `-ilt`   |
  | Less equal to     | `-le` `-cle` `-ile`   |

- Boolean conditions

  - `-and`
  - `-or`
  - `-xor`
  - `-not`
  - `-contains`
  - `-notcontains`
  - `-In`
  - `-NotIn`

- Regular expressions

  - `-Match`
  - `-NotMatch`

- Like

  - `-Like`
  - `-NotLike`

```ps1
"Powershell" -like "Power*"
"Powershell" -like "?owershell"
"Powershell" -like "?ower*[a-z]"
```

## Arrays

```ps1
# Create/declare arrays
$array = "David", "smith"
$array = 1, 2, 3, 4
$array = @("David", "Smith")
$array = @() # Empty array

# Add entry
$array += "Jones"
$array.Add("Jones")

# Read entry
$array[0]

# Update entry
$array[0] = "New value"

# Read numeric array range
$array = 1..100

# Find
$array -contains "David"

# Join array into string (with separator)
$array -join ", "
```

## Hash Tables

```ps1
$countries = @{
  "AU" = "Australia";
  "CA" = "Canada";
  "US" = "United States";
  "UK" = "United Kingdom";
}

# Note that $countries is automatically ordered by key
$countries

# To access entries
$countries["UK"]
$countries."UK"
$countries.UK
```

## Control flow

- Default switch

  ```ps1
  $var = 42
  
  switch ($var)
  {
    41 { "Forty one" }
    42 { "Forty two" }
    43 { "Forty three" }
    default { "Default" }
  }
  ```

- Case sensitive switch

  ```ps1
  $var = "PowerShell"

  switch -CaseSensitive ($var)
  {
    "powershell" { "lowercase" }
    "POWERSHELL" { "UPPERCASE" }
    "PowerShell" { "MixedCase" }
  }
  ```

- Wildcard switch

  ```ps1
  $var = "PowerShell"
  
  switch -Wildcard ($var)
  {
    "plural*" { "*" }
    "?luralsight" { "?" }
    "Pluralsi???" { "???" }
  }
  ```

- Regex switch

  ```ps1
  $var = "r14151"

  switch -regex ($var)
  {
    "[a-d]" {"The color is red."}
    "[e-g]" {"The color is blue."}
    "[h-k]" {"The color is green."}
    "[l-o]" {"The color is yellow."}
    "[p-s]" {"The color is orange."}
    "[t-v]" {"The color is purple."}
    "[w-y]" {"The color is pink."}
    "[z]" {"The color is brown."}
    default {"The color could not be determined."}
  }
  ```

- Switch with arrays

  ```ps1
  $var = 1, 3, 6, 40

  switch ($var)
  {
    1 {"The color is red."}
    2 {"The color is blue."}
    3 {"The color is green."}
    4 {"The color is yellow."}
    5 {"The color is orange."}
    6 {"The color is purple."}
    7 {"The color is pink."}
    8 {"The color is brown."}
    default {"The color could not be determined."}
  }
  ```

## Chain Commands

Commands can be chained by separate them with `;`

```ps1
clear; npm install; npm run build
```

## Pipelining Commands

Commands can be pipelined by separate them with `|`, this will pass the results to the next command

```ps1
Set-Location C:\Windows\System32\

# Get the items and filter the results
Get-ChildItem | Where-Object { $_.Length -lt 1kb }

# Get the items, filter the results and display them in a grid
Get-ChildItem | Where-Object { $_.Length -lt 1kb } | Out-GridView
```

## Script blocks

```ps1
# Run a script block
& { Clear-host; Write-Host "PowerShell is cool !" }

# Store and run a script block
$cool = { Clear-host; Write-Host "PowerShell is cool !" }

# Run a variable with a stored script
& $cool
```

## Functions

- Basic function

  ```ps1
  function Write-HelloWorld()
  {
    Clear-Host
    Write-Host "Hello World"
  }

  Write-HelloWorld
  ```

- Function with parameters

  ```ps1

  function Get-FullName($firstName, $lastName)
  {
    Write-Host ($firstName + " " + $lastName)
  }

  Get-FullName "David" "Smith"
  Get-FullName -lastName "Smith" -firstName "David"
  ```

### Comments in functions

```ps1
<#
  .SYNOPSIS
  Shows a hello message.

  .PARAMETER subject
  The subject.

  .EXAMPLE
  Show-Hello "David"

  .EXAMPLE
  Show-Hello subject "David"
#>
function Show-Hello($subject)
{
  Write-Host "Hello $subject!"
}
```

### Pipeline functions

The pipeline functions are useful for pass the results of a cmdlet to another function.

```ps1

function Show-Result()
{
  Begin
  {
    # Executes once before first item in pipeline is processed
  }
  Process
  {
    # Executes once for each pipeline object
    Write-Host "Item: $_"
  }
  End
  {
    # Executes once after last pipeline object is processed
  }
}

Get-ChildItem | Show-Result
```

## Formats & Outputs

TBC

## Modules

```ps1
# Lists the loaded modules
Get-Module

# Lists the available modules to import
Get-Module –ListAvailable

# Import-Module
Import-Module WebAdministration

# Get a module and show the members (properties and methods)
Get-Module WebAdministration | Get-Member
```

## Various scripts

- List the environment variables

  ```ps1
  Get-ChildItem env:

  # Using the alias
  gci env:
  ```

- List windows services

  ```ps1
  Get-Service | Where-Object { $_.Name -eq "W3SVC" -or $_.Name -eq "WAS" }
  ```

- Test if a path (file or directory) exists

  ```ps1
  Test-Path "c:\scripts\"
  ```

- Check if the current user is administrator

  - Using `required` by adding this command at the beginning of the file, this needs PowerShell 4+ (Windows 8.1+)

    ```ps1
    #Requires -RunAsAdministrator
    ```

  - Checking if the current user is part of the administrators group

    ```ps1
    If (-NOT ([Security.Principal.WindowsPrincipal] [Security.  Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.  Principal.WindowsBuiltInRole]"Administrator"))
    {
      Write-Warning "You do not have Administrator rights to run this script!"

      Write-Host "Please re-run this script as an Administrator!" -ForegroundColor Red

      # Start powershell as admin
      Start-Process PowerShell -Verb RunAs
    }
    ```

## Providers and Drives

```ps1
Get-PSProvider
Get-PSDrives
```

```ps1
Get-ChildItem | Format-Table -Property Name, Directory -AutoSize
```

## More information

- [PowerShell Best Practices and Style](https://poshcode.gitbooks.io/powershell-practice-and-style/content/)
- Development Guidelines
  - [Required Development Guidelines](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/required-development-guidelines)
  - [Strongly Encouraged Development Guidelines](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/strongly-encouraged-development-guidelines)
  - [Advisory Development Guidelines](https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/advisory-development-guidelines)
