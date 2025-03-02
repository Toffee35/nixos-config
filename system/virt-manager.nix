{ ... }: {
  programs.virt-manager.enable = true;

  virtualisation = {
    libvirtd = {
      enable = true;
      storagePools = [{
        name = "default";
        type = "dir";
        target = "/mnt/Files/libvirt/";
      }];
    };

    spiceUSBRedirection.enable = true;
  };
}
