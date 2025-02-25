{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    jetbrains-mono
    fira-code
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
    twemoji-color-font
    font-awesome
    terminus_font
    powerline-fonts
    powerline-symbols
    nerd-fonts.symbols-only
    nerd-fonts.jetbrains-mono
  ];
}
