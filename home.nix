{ username, stateVersion, importList, ... }: {
  imports = (importList ./home);

  home = {
    homeDirectory = "/home/${username}";
    inherit username stateVersion;
  };
}
