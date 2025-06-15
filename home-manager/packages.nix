{pkgs, ...}: {
  home.packages = with pkgs; [
    telegram-desktop
    postman
    obsidian
  ];

  programs = {
    git.enable = true;
    tmux.enable = true;
    btop.enable = true;
    lazydocker.enable = true;
  };
}
