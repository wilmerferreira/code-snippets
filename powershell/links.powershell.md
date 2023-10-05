# PowerShell: Links

## Symbolic Link

```ps1
New-Item -ItemType SymbolicLink -Path "SymbolicLinkPath" -Target "TargetPath"
```

## Junction Link

```ps1
New-Item -ItemType Junction -Path "JunctionLinkPath" -Target "TargetPath"
```

## Hard Link

```ps1
New-Item -ItemType HardLink -Path "HardLinkPath" -Target "TargetPath"
```

## More Information

- [Create Symbolic Link in Windows 10 with PowerShell](https://winaero.com/create-symbolic-link-windows-10-powershell/)
