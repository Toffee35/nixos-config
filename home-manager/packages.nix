{pkgs, ...}: {
  home.packages = with pkgs; [
    telegram-desktop
    postman
    obsidian
    chromium
    gemini-cli

    ffmpeg_8-full
  ];

  programs = {
    git = {
      enable = true;
      extraConfig = {
        init.defaultBranch = "main";
        submodule.recurse = "true";
      };
    };
    tmux.enable = true;
    btop.enable = true;
    lazydocker.enable = true;
  };
}
