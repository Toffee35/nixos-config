{
  username,
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [
      python313
      uv

      stdenv.cc.cc.lib

      jetbrains.pycharm-community
    ];

    sessionVariables = {
      UV_PYTHON_DOWNLOADS = "never";
      LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
    };
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
