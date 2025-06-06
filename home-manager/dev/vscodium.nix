{
  username,
  pkgs,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.${username} = {
      extensions = with pkgs.vscode-extensions; [
        pkief.material-icon-theme

        ms-azuretools.vscode-docker

        jnoortheen.nix-ide
        kamadorueda.alejandra
        bbenoist.nix
        jeff-hykin.better-nix-syntax
      ];

      userSettings = {
        workbench = {
          iconTheme = "material-icon-theme";
          sideBar.location = "right";
        };

        editor = {
          lineNumbers = "on";
          wordWrap = "on";
          formatOnSave = true;
          codeActionsOnSave.source = {
            organizeImports = "explicit";
            fixAll = "explicit";
          };
        };

        files = {
          autoSave = "onFocusChange";
          trimTrailingWhitespace = true;
          insertFinalNewline = true;
        };

        git = {
          enableSmartCommit = true;
          confirmSync = false;
        };

        nix = {
          enableLanguageServer = true;
          serverPath = "${pkgs.nil}/bin/nil";
        };
      };
    };
  };
}
