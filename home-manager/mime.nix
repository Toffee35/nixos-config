{pkgs, ...}: {
  home.packages = with pkgs; [
    vlc
    eog
  ];

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "video/*" = "vlc.desktop";
      "audio/*" = "vlc.desktop";
      "image/*" = "eog.desktop";
      "x-scheme-handler/tg" = "org.telegram.desktop.desktop";
      "x-scheme-handler/tonsite" = "org.telegram.desktop.desktop";
    };
  };
}
