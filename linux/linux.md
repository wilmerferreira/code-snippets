# Linux

The following commands helps to find out which version is installed

```sh
# Returns the machine name, kernel's version and some more information
uname -a

# Returns some variables about the current distro's release
cat /etc/*release

# Returns more or less the same information in a better looking way
neofetch
```

## Package Managers

- `DPKG` (Debian Package Management System)
  - `apt` (Advanced Packaging Tool): used by _ubuntu_.
  - `aptitude` (Aptitude Package Manager)

- `RPM` (Red Hat Package Manager), it is also used by _fedora_.
  - `yum` (Yellowdog Updater, Modified) and `dnf` (Dandified Yum)
  - `zypper` and `YaST`

- `Pacman` Package Manager

## Common Commands

- `hostnamectl`: Control the system hostname

  ```sh
  sudo hostnamectl set-hostname k8s-control
  ```

- `sudo`, `sudoedit`: execute a command as another user
- `tee`: read from standard input and write to standard output and files
