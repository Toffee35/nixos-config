{
  pkgs,
  username,
  ...
}: {
  home = {
    packages = with pkgs;
      [
        nodejs

        pnpm
        bun

        jetbrains.webstorm
      ]
      ++ (with pkgs.nodePackages; [
        npm

        typescript-language-server
        eslint
        prettier
      ]);
  };

  programs.vscode.profiles.${username}.extensions = with pkgs.vscode-extensions; [
    ms-python.python
    ms-python.debugpy
    ms-python.vscode-pylance
    charliermarsh.ruff
    ms-toolsai.jupyter
  ];
}
