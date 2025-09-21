{pkgs, ...}: {
  home.packages = with pkgs; [
    go

    jetbrains.goland
  ];
}
