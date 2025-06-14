{
  username,
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [
      (python313.withPackages (
        ps:
          with ps; [
            pandas
            requests
          ]
      ))
      uv

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
