{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    prismlauncher = {
      url = "github:Diegiwg/PrismLauncher-Cracked";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, prismlauncher, ... }:
    let
      system = "x86_64-linux";
      hostname = "0NDesktop";
      username = "n";
      flakedir = "~/nixos-config/";
      stateVersion = "24.11";

      importList = import ./functions/importList.nix;

      pkgs-stable = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };

      specialArgs = {
        inherit system hostname username flakedir stateVersion prismlauncher
          pkgs-stable importList;
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

          modules = [ ./home.nix ];
        };
    };
}
