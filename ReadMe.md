# NixOS Configuration with Flakes

This repository contains my NixOS configuration managed with Flakes. It includes multiple host-specific configurations:

- **strawberry**: Uses Xorg, focuses on stability, and is frequently updated.
- **blueberry**: Uses Wayland and is updated less frequently.

## Installation

Clone the repository:

```bash
git clone https://github.com/Toffee35/nixos-config.git
```

Update `flake.nix`:

- Replace `hostname` and `username` values with your own.

Build and apply the NixOS and Home configuration:

```bash
sudo nixos-rebuild switch --flake .#<host>  --impure
home-manager switch --flake .#<host>
```

Replace `<host>` with your target host, e.g., `strawberry` or `blueberry`.

## Strawberry 🍓

 **Window Manager**  | Awesome
:-------------------:|:---------:
 **File Manager**    | Thunar
 **Terminal**        | Alacritty
 **Menu**            | Rofi
 **Display Manager** | Sddm
 **Shell**           | Zsh
 **Audio**           | Pipewire
 **Video**           | Nvidia

### Services

- bluetooth
- ssh
- clipcat

<br>

![Screenshot](./pulic/strawberry.png)
