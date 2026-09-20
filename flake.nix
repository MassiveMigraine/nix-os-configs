{
  description = "bigcity's NIX config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
      };
    };
  
  outputs = { nixpkgs, home-manager, ... }:
  {

      nixosConfigurations.x1nano = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./configuration.nix
          ./machines/x1nano/configuration.nix

          home-manager.nixosModules.home-manager

          {
            home-manager.users.ghost = 
              import ./machines/x1nano/home.nix;
            }
        ];
      };

      nixosConfigurations.x1nano = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./configuration.nix
          ./machines/genric-vm/configuration.nix

          home-manager.nixosModules.home-manager

          {
            home-manager.users.ghost = 
              import ./machines/generic-vm/home.nix;
            }
        ];
      };

    };
}
