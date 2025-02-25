# NixOS Configuration (v24.11)

This configuration was created solely for my personal use. It can serve as an example for creating your own configuration.

## System Overview

- **Device:** Laptop with Intel graphics and NVIDIA GT 650M.
- **Drivers:** Using NVIDIA drivers version 470. Since Wayland is unstable with NVIDIA, I use Xorg, specifically the **Qtile** window manager.
- **DPI:** The X server DPI is fixed at 92.
- **Display Manager:** SDDM with the *Astronaut* theme.
- **Bluetooth:** Although my laptop supports Bluetooth, NixOS selects incorrect drivers for my model, so I had to enable the `enableAllFirmware` option.

## File System

1. **FAT32 partition** (0.5 GB) for GRUB.
2. **ext4 partition** (109 GB) for root. Additionally, a separate disk with projects and games is mounted in the user's `/home` directory.
3. **Swap partition** (9 GB).

## Software and Tools

- **Programming Languages:** Python, Rust, and Node.js (with additional packages).
- **Utilities:** I mainly use `doas`, but I keep `sudo` as a fallback.
- **System Cleanup:** Automatic removal of packages and NixOS generations (a daily check deletes generations older than two days).
- **Microcode:** Installed `ucode-intel`.
- **Localization:** Turkish time zone and English language.
- **Network:** Using NetworkManager.
- **Gaming:** Occasionally play Minecraft using Prism Launcher.
- **Audio:** Pipewire.
- **Remote Access:** SSH for connecting to the computer remotely.
- **Code Editors:** VSCode for development and nano as a lightweight editor.
- **Terminal and Shell:** Alacritty for its attractive out-of-the-box appearance and zsh as my shell (occasionally using tmux).
- **Others:** Transmission for torrent downloads and Lutris for launching games.
- **Browsers:** Chrome and Firefox.


---

### Translated and improved my text gpt chat 4o + deep think.
*I didn't even read what he wrote*
