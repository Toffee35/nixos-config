{pkgs, ...}: {
  home.packages = with pkgs; [
    telegram-desktop
    postman
    obsidian
    chromium
    gemini-cli

    jetbrains.datagrip
  ];

  programs = {
    git = {
      enable = true;
      extraConfig.init.defaultBranch = "main";
    };
    tmux.enable = true;
    btop.enable = true;
    lazydocker.enable = true;
  };
}
