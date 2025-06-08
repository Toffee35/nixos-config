{
  nixList,
  username,
  homedir,
  ...
}: {
  imports = nixList ./.;

  home = {
    inherit username;
    homeDirectory = homedir;

    enableNixpkgsReleaseCheck = false;

    stateVersion = "25.11";
  };
}
