{ lib, hostname, ... }: {
  networking = {
    hostName = hostname;
    useDHCP = lib.mkDefault true;
    firewall = {
      allowedTCPPortRanges = {
        from = 2000;
        to = 10000;
      };
      allowedUDPPortRanges = {
        from = 2000;
        to = 10000;
      };
    };
  };
}
