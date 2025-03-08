{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ vlc eog ];

  xdg.mime.defaultApplications = {
    "image/*" = "eog.desktop";
    "video/*" = "vlc.desktop";
    "audio/*" = "vlc.desktop";
    "text/*" = "codium.desktop";
  };

  environment.sessionVariables = {
    EDITOR = "nano";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };
}
