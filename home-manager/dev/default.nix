{
  nixList,
  pkgs,
  ...
}: {
  imports = nixList ./.;

  home.packages = with pkgs; [
    gcc
    libstdcxx5
    libcap
    pkg-config
    openssl
    sqlite
  ];
}
