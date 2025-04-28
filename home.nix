{ username, stateVersion, importList, ... }: {
  imports = importList {
    dir = ./home;
    inherit pkgs;
  };

  home = {
    homeDirectory = "/home/${username}";
    inherit username stateVersion;
  };
}
