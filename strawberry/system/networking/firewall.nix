{ ... }: {
  networking.firewall = {
    enable = true;

    allowPing = true;
      
    allowedTCPPorts = [ 80 443 ];
    allowedTCPPortRanges = [
      { from = 2000; to = 9000; }
    ];

    allowedUDPPorts = [ 80 443 ];
    allowedUDPPortRanges = [
      { from = 2000; to = 9000; }
    ];
  };
}
