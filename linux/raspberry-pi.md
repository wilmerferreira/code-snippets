# Raspberry PI

## How to enable features

1. Connect via `ssh`, e.g., `ssh username@hostname`
2. Enter sudo `raspi-config` in a terminal window
3. Select `Interfacing Options`
4. Navigate to and select the desired option, e.g. `VNC`
5. Follow the steps required for that feature

## Tools

- [Visual Studio Code](https://code.visualstudio.com/docs/setup/raspberry-pi)
  
  ```sh
  sudo apt update
  sudo apt install code
  ```

- [Pi-hole](https://docs.pi-hole.net/main/basic-install/)

  ```sh
  curl -sSL https://install.pi-hole.net | bash
  ```
