{ ... }: {
  imports = [
    ./packages/alacritty/home.nix
    ./packages/awesome/home.nix
    ./packages/clipcat/home.nix
    ./packages/gtk/home.nix
    ./packages/qt/home.nix
    ./packages/rofi/home.nix
    ./packages/zsh/home.nix

    ./system/user/home.nix
  ];
}
