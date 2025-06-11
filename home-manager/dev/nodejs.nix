{pkgs, username, ...}: {
  home = {
    packages = with pkgs; [
      nodejs
      nodePackages.npm
      pnpm

      jetbrains.webstorm
    ];
  };

  programs.vscode.profiles.${username}.extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-python.debugpy
      ms-python.vscode-pylance
      fill-labs.dependi
      charliermarsh.ruff
      ms-toolsai.jupyter
    ];
}
