# Permissions

- `useradd`: Creates a user
- `passwd`: Sets the login password

  > User information is stored in `/etc/passw`

- `addgroup`: Creates groups
- `su`: Login with another account

## File permissions

- `chmod`: changes the permission of a file.

  - symbolic mode: [ugoa] + [=+-] + [rwx] + filename
    - **o**wner, **g**roup, **o**thers, all
    - set (`=`), add (`+`) and remove (`-`)
    - **r**ead, **w**rite, e**x**ecute

    ```sh
    chmod o+wx $FILE # Adds the write and execute permissions to owner
    ```

  - numeric mode
    - **r**ead: 4
    - **w**rite: 2
    - e**x**ecute: 1

    ```sh
    chmod 7777 $FILE
    ```

- `umask`
- `whoami`, `id`
- `chown`
- `chgrp`
- `su`: runs a command with substitute user and group ID

### Special File Permissions

| Permissions               | File                                      | Directory                                                                             |
|---------------------------|-------------------------------------------|---------------------------------------------------------------------------------------|
| `SUID` (`s` or `S`)       | Run file as a file owner                  |                                                                                       |
| `SGID` (`s` or `S`)       | Run file as a member of the file group    | All of the files insider of it will belong to the directory group                     |
| _Sticky bit_ (`t` or `T`) |                                           | Prevents files inside of it from being removed by anyone but the owner of that file   |
