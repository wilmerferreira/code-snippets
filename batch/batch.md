# Batch

## Rules

- Batch files can use `.bat` or `.cmd` extensions
- Is case **In**sensitive
- Comments can be done using the `REM` keyword or `::`
- The `@` character before the command avoid print out the command invocation
- Variables can be declared using the `SET` command (without spaces between the variable and the value)
  - The `SET /A` attribute enables calculations on the variable assignment (this can be used to "validate" if the value is a number)
  - The `SET` command without any arguments will retrieve all the variables for the current session (without the dynamic environmental variables)
  - Local scoped variables can be defined using the `SETLOCAL` command and the context can be restored when
    - With the `ENDLOCAL` command
    - With the `EXIT` command
    - When the execution reaches the end of the file

## Arguments

Arguments can be used with the percentage character followed by a digit (from 0 up to 9). e.g. `%1`

| Flags     | Description                                 |
|-----------|---------------------------------------------|
| `%~1`     | Removes the quotes from the parameter       |
| `%~f1`    | Retrieves the folder for the first command  |
| `%~s1`    | Retrieves short version of the path         |
| `%~d1`    | Retrieves the drive of the path             |
| `%~p1`    | Retrieves the parent folder (without drive) |
| `%~dp1`   | Retrieves the parent folder                 |
| `%~n1`    | Retrieves the file name (without extension) |
| `%~x1`    | Retrieves the extension                     |
| `%~nx1`   | Retrieves the filename and extension        |

## Delayed Expansion

Look at the following example, the variables in the for loop are expanded one one time.

```cmd
@echo off
set COUNT=0

for %%v in (1 2 3 4) do (
  set /A COUNT=%COUNT% + 1
  echo Count = %COUNT%
)
pause
```

This script will output:

```sh
Count = 0
Count = 0
Count = 0
Count = 0
```

In the other hand, if we use delayed expansion, we have the following script, which will run as expected

```cmd
setlocal ENABLEDELAYEDEXPANSION
set COUNT=0

for %%v in (1 2 3 4) do (
  set /A COUNT=!COUNT! + 1
  echo Count = !COUNT!
)

pause
```

As expected, it will output:

```sh
Count = 1
Count = 2
Count = 3
Count = 4
```

## System Variables

| Variable      | Description       |
|---------------|-------------------|
| `%CD%`        | Current Directory |
| `%DATE%`      | Current Date      |
| `%RANDOM%`    | Random Number     |

## Conventions and good practices

- Use [pascal, snake or kebab case](https://en.wikipedia.org/wiki/Letter_case#Special_case_styles) for batch filenames

- Use the variable names in _lowercase_, this is because the system variables are in _UPPERCASE_

- Always start the file with
  - The `SETLOCAL` command ensures that I don’t  (overwrite) any existing variables after my script exits.
  - The `ENABLEEXTENSIONS` argument turns on a very helpful feature called command processor extensions. By default they are enabled. however, it's a good practice to add that to be absolutely sure that they are.

  ```cmd
  SETLOCAL ENABLEEXTENSIONS
  SET me=%~n0
  SET parent=%~dp0
  ```

- Always exit the program `EXIT /B 0`, this will finish the script without errors (`errorlevel` as `0`).

## Redirection

- **Pipe** commands: allows to send the output of one command as input to the subsequent command, to pipe add `|` between commands

  ```cmd
  REM Pipe the output from `commandA` into `commandB`
  commandA | commandB

  REM List folders and files in descendant order
  DIR /B /A- | SORT /R
  ```

- **Chain** commands: enable execute multiple commands in a single line. To chain commands add `&` between commands.
  
  ```cmd
  REM Run commandA and then run commandB
  commandA & commandB

  REM Reconfigure the IP address used by the network card
  REM Clear the console, remove the assigned IP address and renew the IP address
  clear & ipconfig /release & ipconfig /renew
  ```

- Run `commandA`, if it succeeds then run `commandB`

  ```cmd
  commandA && commandB
  ```

- Run `commandA`, if it fails then run `commandB`

  ```cmd
  commandA || commandB
  ```

- Redirect to NUL (hide errors)

  ```cmd
  REM Redirect error messages to NUL
  command 2> nul
  ```

- Working with files

  - Save the `command` output to a file

    - Creates or override the file's content

      ```cmd
      REM Redirect command output to a file
      command > filename

      REM Ping the google's main domain and save the result in a text file
      ping google.com > ping.txt
      ```

    - Append the result to an existing file of a `command` into a file

      ```cmd
      REM Redirect command output to a file
      command >> filename
      ```

  - Load the file and use in the `command`

    ```cmd
    Type a text file and pass the text to `command`
    command < filename

    REM Save the system32's dlls in a file and sort the content of file
    DIR /B c:\Windows\System32\*.dll > system32-dlls.txt
    SORT /r < system32-dlls.txt
    ```

## Boolean operators

| Operator  | Description           |
|-----------|-----------------------|
| `NOT`     | Not                   |
| `EQU`     | Equal                 |
| `NEQ`     | Not equal             |
| `LSS`     | Less than             |
| `LEQ`     | Less than or equal    |
| `GTR`     | Greater than          |
| `GEQ`     | Greater than or equal |

> Batch doesn't support _AND_ and _OR_ operators

Comparison Or with a case insensitive comparison

```cmd
IF /I "%var%"=="hello, world!" (
  ECHO found
)
```

## Useful commands

- `NET`

  ```cmd
  REM List local users
  net user

  REM Shows local user details
  net user "Administrator"

  REM List active directory users
  net user /domain

  REM Shows active directory user details
  net user "username" /domain

  REM List active directory groups
  net group /domain

  REM Lists the accounts members of a given active directory domain group
  net group "ls1 developers" /domain
  ```

- `SET` displays the environment variables
- `TYPE` displays the content of a given file

## More information

- [Batch Script Tutorial](https://www.tutorialspoint.com/batch_script/index.htm)
- [Guide to Windows Batch Scripting](http://steve-jansen.github.io/guides/windows-batch-scripting/index.html)
- [An A-Z Index of Windows CMD commands](https://ss64.com/nt/)
- [Windows CMD Shell How-to guides and examples](https://ss64.com/nt/syntax.html)
