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
    };
  };
}
