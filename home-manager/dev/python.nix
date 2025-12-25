{
  username,
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [
      uv
      poetry
      python313

      python313Packages.greenlet

      ruff
      pyright
      mypy

      jetbrains.pycharm
    ];

    sessionVariables = {
      UV_PYTHON_DOWNLOADS = "never";
      UV_LINK_MODE = "copy";
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
      ms-python.pylint
      ms-python.mypy-type-checker
      charliermarsh.ruff
    ];
  };
}
