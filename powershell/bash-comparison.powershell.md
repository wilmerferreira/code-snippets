# PowerShell vs Bash

| Linux                     | PowerShell                                |
|---------------------------|-------------------------------------------|
| `compgen` / `man builtin` | `Get-Command`                             |
| `man`                     | `Get-Help`                                |
| `ls`                      | `Get-ChildItem`                           |
| `cat / tail`              | `Get-Content` / `Get-Content -Tail 10`    |
| `ps / top`                | `Get-Process`                             |
| `wc`                      | `Measure-Object`                          |
| `sort`                    | `Sort-Object`                             |
| `tee`                     | `Tee-Object`                              |
| `grep`                    | `Select-String`                           |
| `touch`                   | `New-Item`                                |
| `tar`                     | `Compress-Archive` / `Expand-Archive`     |
| `history`                 | `Get-History` / `Invoke-History`          |
| `cd ~`                    | `cd ~` / `cd $home`                       |
| `pwd`                     | `$pwd`                                    |
| `env`                     | `Get-ChildItem env:\`                     |
