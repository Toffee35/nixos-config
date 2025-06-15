{
  nixList,
  pkgs,
  ...
}: {
  imports = nixList ./.;

  home.packages = with pkgs; [
    gcc
    pkg-config
    openssl
    sqlite
  ];
}
