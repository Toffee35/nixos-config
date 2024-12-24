{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    lutris
    bottles
    wineWowPackages.stable
    winetricks
  ];
}
