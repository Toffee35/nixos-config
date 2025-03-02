{ lib, hostname, ... }: {
  networking = {
    hostName = hostname;
    useDHCP = lib.mkDefault true;

    firewall = {
      allowedUDPPorts = [ 51820 ];
      allowedTCPPorts = [ 51820 ];

      allowedTCPPortRanges = [{
        from = 2000;
        to = 10000;
      }];

      allowedUDPPortRanges = [{
        from = 2000;
        to = 10000;
      }];
    };
  };
}
