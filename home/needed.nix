{ username, stateVersion, ... }: {
  home = {
    homeDirectory = "/home/${username}";
    inherit username stateVersion;
  };
}
