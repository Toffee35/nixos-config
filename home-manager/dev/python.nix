{
  username,
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [
      python313
      uv

      python313.pkgs.pandas

      jetbrains.pycharm-community
    ];

    sessionVariables.UV_PYTHON_DOWNLOADS = "never";
  };

  programs = {
    ruff = {
      enable = true;
      settings = {};
    };

    vscode.profiles.${username}.extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-python.debugpy
      ms-python.vscode-pylance
      charliermarsh.ruff
    ];
  };
}
