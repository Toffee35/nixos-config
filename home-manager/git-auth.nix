{...}: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."*".addKeysToAgent = "yes";
  };

  programs.git = {
    userEmail = "nailzagru@gmail.com";
    userName = "Toffee35";
  };
}
