# PowerShell: Installed Programs

- Using `Get-WmiObject`

  - Using `Win32Reg_AddRemovePrograms` class

    ```ps1
    # Get the installed programs
    Get-WmiObject -Class Win32Reg_AddRemovePrograms `
        | Select DisplayName, Publisher, Version `
        | Sort DisplayName, Version
    ```

  - Using `Win32_Product` class (slow)

    ```ps1
    Get-WmiObject -Class Win32_Product `
        | Select Name, Vendor, Version `
        | Sort Name, Version
    ```

- Using the registry

  ```ps1
  Get-ChildItem "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall" `
    | Select { $_.GetValue("DisplayName"), $_.GetValue("Publisher"), $_.GetValue("DisplayVersion") }
  ```

## Using WinGet

- `install`: Installs the given package
  - Arguments
    - `-q,--query`: The query used to search for a package
  - Options
    - `-m,--manifest`: The path to the manifest of the package
    - `--id`: Filter results by id
    - `--name`: Filter results by name
    - `--moniker`: Filter results by moniker
    - `-v,--version`: Use the specified version; default is the latest version
    - `-s,--source`: Find package using the specified source
    - `--scope`: Select install scope (user or machine)
    - `-e,--exact`: Find package using exact match
    - `-i,--interactive`: Request interactive installation; user input may be needed
    - `-h,--silent`: Request silent installation
    - `--locale`: Locale to use (BCP47 format)
    - `-o,--log`: Log location (if supported)
    - `--override`: Override arguments to be passed on to the installer
    - `-l,--location`: Location to install to (if supported)
    - `--force`: Override the installer hash check
    - `--accept-package-agreements`: Accept all licence agreements for packages
    - `--header`: Optional Windows-Package-Manager REST source HTTP header
    - `--accept-source-agreements`: Accept all source agreements during source operations
- `show`: Shows information about a package
- `source`: Manage sources of packages
- `search`: Find and show basic info of packages
- `list`: Display installed packages
- `upgrade`: Upgrades the given package
- `uninstall`: Uninstalls the given package
- `hash`: Helper to hash installer files
- `validate`: Validates a manifest file
- `settings`: Open settings or set administrator settings
- `features`: Shows the status of experimental features
- `export`: Exports a list of the installed packages
- `import`: Installs all the packages in a file

```ps1
# This will update the packages
winget upgrade

# This will search for packages called "powershell"
winget search powershell | sort id

# Default install command
winget install Microsoft.PowerShell

# Silent installation
winget install Microsoft.PowerShell --silent
```

https://gist.github.com/LanceMcCarthy/351330330072484b4c96b6c97b87fe5b?WT.mc_id=-blog-scottha

```ps1
# TODO: Check account membership per role (developer, QA, etc.)
```

```ps1
#Requires -RunAsAdministrator

Enable-WindowsOptionalFeature -Online -FeatureName "Microsoft-Windows-Subsystem-Linux"

# Install Choco (some dependencies aren't yet available in winget) https://chocolatey.org/install
# WARN: Disable zscaler in order to run this
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# ubuntu
winget install --id "Microsoft.PowerShell" --exact --source winget
winget install --id "Microsoft.Teams" --exact --source winget
winget install --id "Microsoft.WindowsTerminal" --exact --source winget
# TODO: Add PowerShell Core profile to Windows Terminal
winget install --id "Git.Git" --exact --source winget
# TODO: Add Git Bash profile to Windows Terminal
winget install --id "OpenJS.NodeJS.LTS" --exact --source winget
winget install --id "Docker.DockerDesktop" --exact --source winget
# TODO: Enable k8s in Docker Desktop
choco install kubernetes-helm
# TODO: Add our helm repository
winget install --id "Mirantis.Lens" --exact --source winget
# TODO: Configure local cluster in Lens
# TODO: Configure dev cluster in Lens
# TODO: Configure uat cluster in Lens
winget install --id "Microsoft.SQLServerManagementStudio" --exact --source winget
winget install --id "MongoDB.Compass.Full" --exact --source winget
# TODO: Configure local instance in mongo compass
# TODO: Configure dev instance in mongo compass
# TODO: Configure uat instance in mongo compass

# Install Visual Studios
winget install "Microsoft.VisualStudio.2022.Professional" --exact --source winget
# winget install "Microsoft.VisualStudio.2019.Professional" --exact --source winget
# TODO: Extensions
winget install "Microsoft.VisualStudioCode" --exact --source winget
# TODO: AWS CLI

# TODO: Configure GitLabs' ssh certificate
# TODO: Configure npm sources

# TODO: Configure nuget sources
# TODO: install octo
# TODO: What if we add the octo tool as a nuget tool? see https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-tool-install
# TODO: Setup local aws profile
# TODO: Configure docker sources
```

## More Information

- [Use PowerShell to Quickly Find Installed Software](https://devblogs.microsoft.com/scripting/use-powershell-to-quickly-find-installed-software/)
- [How to quickly check installed software versions](https://www.codetwo.com/admins-blog/how-to-check-installed-software-version/)
