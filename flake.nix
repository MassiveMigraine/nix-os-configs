{
  description = "bigcity's NIX configs";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
      };
    };
  
  outputs = { nixpkgs, home-manager, ... }:
  let
    makeHost = { nixConfigDir, dotFileDir, machineName, username, hostName, autoLogin }:
    nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./machines/${machineName}/configuration.nix
        {
          networking.hostName = hostName;
          users.users.${username} = {
            isNormalUser = true;
            description = username;
            extraGroups = [ "networkmanager" "wheel" ];
          };
        }
        home-manager.nixosModules.home-manager
        {
          home-manager.backupFileExtension = "bak";
          home-manager.extraSpecialArgs = {
            inherit nixConfigDir dotFileDir machineName username;
            allMachinedotFiles = "/home/${username}/${dotFileDir}/all-machines";
            machineSpecificdotFiles = "/home/${username}/${dotFileDir}/${machineName}";
          };
          home-manager.users.${username} = {
            imports = [
              ./home.nix
              ./machines/${machineName}/home.nix
            ];
            home.username = username;
            home.homeDirectory = "/home/${username}";
            home.stateVersion = "26.05";
          };

          services.displayManager = {
            autoLogin.enable = autoLogin;
            autoLogin.user = username;
          };

        }
      ];
    };
  in
  {
  nixosConfigurations.x1nano = makeHost {
    nixConfigDir = ".nix-config";
    dotFileDir = ".dotfiles";
    machineName = "x1nano";
    hostName = "ghost-laptop";
    username = "ghost";
    autoLogin = true;
  };

  nixosConfigurations.media= makeHost {
    nixConfigDir = ".nix-config";
    dotFileDir = ".dotfiles";
    machineName = "media";
    hostName = "media-pc";
    username = "media";
    autoLogin = true;
  };
};
}
