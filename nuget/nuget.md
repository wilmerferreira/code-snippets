# nuget

Nuget uses [semantic versioning](https://semver.org), see [FAQ](https://semver.org/spec/v2.0.0.html#faq) for more information

## NuGet Cache

Stores downloaded NuGet packages (.nupkg).

- Mac
  - `~/.local/share/NuGet/Cache`
  - `~/.nuget/packages`
- Windows
  - `%LocalAppData%\NuGet\Cache` or `%USERPROFILE%\AppData\Local\NuGet\Cache`
  - `%UserProfile%\.nuget\packages`
- Linux
  - `~/.local/share/NuGet/Cache`
  - `~/.nuget/packages`

## Good practices

- Always start new developments with `0.#.#`, a public release should then change to `1.#.#`
- Use a local path for the in dev nuget packages, e.g. `c:\nuget\`

## Commands

- Find Packages

    ```ps
    Find-Package "Search.Airline.Api.Client" -pre
    ```

- List packages you have installed

    ```ps
    Get-Package
    ```

- List available packages containing the word foo

    ```ps
    Get-Package -ListAvailable foo
    Get-Package -Filter Logging -ListAvailable
    ```

- Install package:

    ```ps
    Install-Package foo
    ```

- Update a package to specific version

    ```ps
    Update-Package Antlr
    Update-Package Antlr -Version 3.5.0.2
    Update-Package Antlr -Version 3.5.0.2 -Whatif
    ```

- Uninstall or remove a package

    ```ps
    Uninstall-Package foo -RemoveDependencies
    Uninstall-Package Newtonsoft.Json -Version 6.0.4
    ```

- Checks a specific package update in a specific project

    ```ps
    Get-Project LS1.Toolbox | Update-Package WebGrease -Version 1.6.0 -Whatif
    ```

- Update a specific package update in a specific project

    ```ps
    Get-Project LS1.Toolbox | Update-Package WebGrease -Version 1.6.0
    ```

- To reinstall the packages

    ```ps
    Update-Package -Reinstall
    ```

- Update based on a wildcard

    ```ps
    Get-Package | Where Id -like "LS1.*" | Sort-Object -Property Id -Unique | foreach { Update-Package $_.Id }
    ```

- Help

    ```ps
    Get-Help Uninstall-Package
    ```

## References

- [Package Manager Console Powershell Reference](https://docs.nuget.org/consume/package-manager-console-powershell-reference)
- [.nuspec reference](https://docs.microsoft.com/en-us/nuget/reference/nuspec)
  - [Target Frameworks: Supported frameworks](https://docs.microsoft.com/en-us/nuget/reference/target-frameworks#supported-frameworks)
- [How do I get NuGet to install/update all the packages in the packages.config?](http://stackoverflow.com/questions/6876732/how-do-i-get-nuget-to-install-update-all-the-packages-in-the-packages-config)
- [NuGet File Locations](https://lastexitcode.com/projects/NuGet/FileLocations/)