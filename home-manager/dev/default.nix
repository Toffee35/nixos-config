{
  nixList,
  pkgs,
  ...
}: {
  imports = nixList ./.;

  home.packages = with pkgs; [
    zlib
    stdenv.cc.cc.lib
    gcc
    pkg-config
    openssl
    sqlite
  ];
}
