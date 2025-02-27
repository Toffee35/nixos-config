{ ... }: {
  # home.file.".local/share/rofi/themes".source = ../configs/rofi;

  programs.rofi = {
    enable = true;
    theme = ./theme.rasi;
  };
}
