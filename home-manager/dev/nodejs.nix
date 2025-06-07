{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      nodejs
      nodePackages.npm
      pnpm

      jetbrains.webstorm
    ];
  };
}
