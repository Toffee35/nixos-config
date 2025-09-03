{...}: {
  programs.ssh = {
    enable = true;
    matchBlocks.addKeysToAgent = "yes";
  };

  programs.git = {
    userEmail = "nailzagru@gmail.com";
    userName = "Toffee35";
  };
}
