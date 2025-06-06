{
  username,
  pkgs,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.${username}.extensions = with pkgs.vscode-extensions; [
      pkief.material-icon-theme

      jnoortheen.nix-ide
      kamadorueda.alejandra
      bbenoist.nix
      jeff-hykin.better-nix-syntax
    ];
  };
}
