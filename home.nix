{ username, stateVersion, importList, pkgs, ... }: {
  imports = importList ./home;

  home = {
    homeDirectory = "/home/${username}";
    inherit username stateVersion;
  };
}
