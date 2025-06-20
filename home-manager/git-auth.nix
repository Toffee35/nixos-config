{...}: {
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
  };

  programs.git = {
    userEmail = "nailzagru@gmail.com";
    userName = "Toffee35";
  };
}
