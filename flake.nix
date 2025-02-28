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
      stateVersion = "24.11";

      specialArgs = {
        inherit system hostname username flakedir stateVersion prismlauncher;
      };
    in {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        inherit system specialArgs;
        modules = [ ./system.nix ];
      };

      homeConfigurations.${username} =
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = specialArgs;
          backupFileExtension = "backup";
          modules = [ ./home.nix ];
        };
    };
}
