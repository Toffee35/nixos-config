{ ... }: {
  security.doas = {
    enable = true;

    extraRules = [{
      groups = [ "wheel" ];
      persist = true;
    }];
  };
}
