{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    prismlauncher = {
      url = "github:Diegiwg/PrismLauncher-Cracked";
      inputs.flake-compat.follows = "";
    };
  };

  outputs = { self, nixpkgs, home-manager, prismlauncher, ... }:
    let
      system = "x86_64-linux";

      hostname = "0NDesktop";
      username = "n";

      flakedir = "~/nixos-config/";

      specialArgs = { inherit hostname username flakedir prismlauncher; };
    in {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        inherit system specialArgs;
        modules = [
          ./system.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = specialArgs;

            home-manager.users.ryan = import ./home.nix;
          }
        ];
      };
    };
}
