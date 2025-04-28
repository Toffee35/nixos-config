{ username, stateVersion, importList, pkgs, ... }: {
  imports = importList {
    dir = ./home;
    inherit pkgs;
  };

  home = {
    homeDirectory = "/home/${username}";
    inherit username stateVersion;
  };
}
