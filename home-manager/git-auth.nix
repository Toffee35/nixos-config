{...}: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."*".addKeysToAgent = "yes";
  };

  programs.git = {
    settings.user.email = "nailzagru@gmail.com";
    settings.user.name = "Toffee35";
  };
}
