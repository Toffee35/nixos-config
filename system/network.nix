{ lib, hostname, ... }: {
  networking = {
    hostName = hostname;
    useDHCP = lib.mkDefault true;
  };
}
