{ lib, hostname, ... }: {
  networking = {
    hostName = hostname;
    useDHCP = lib.mkDefault true;
    firewall = {
      allowedTCPPorts = [ 57621 ];
      allowedUDPPorts = [ 5353 ];
    };
  };
}
