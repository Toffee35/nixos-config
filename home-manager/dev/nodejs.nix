{
  pkgs,
  username,
  ...
}: {
  home = {
    packages = with pkgs; [
      nodePackages.npm
      pnpm

      jetbrains.webstorm
    ];
  };

  programs.vscode.profiles.${username}.extensions = with pkgs.vscode-extensions; [
    ms-python.python
    ms-python.debugpy
    ms-python.vscode-pylance
    charliermarsh.ruff
    ms-toolsai.jupyter
  ];
}
