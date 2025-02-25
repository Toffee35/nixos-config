{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    prismlauncher = {
      url = "github:Diegiwg/PrismLauncher-Cracked";
      inputs.flake-compat.follows = "";
    };
  };

  outputs = { self, nixpkgs, prismlauncher, ... }:
    let
      system = "x86_64-linux";
      hostname = "0NDesktop";
      username = "n";
      flakedir = "~/nixos-config/";
    in {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit hostname username flakedir prismlauncher; };
        modules = [ ./system.nix ];
      };
    };
}
