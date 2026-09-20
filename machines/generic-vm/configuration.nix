{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set hostname
  networking.hostName = "generic-vm"; # Define your hostname.

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."ghost" = {
    isNormalUser = true;
    description = "ghost";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  home-manager.users.ghost= {
    imports = [
      ../../home.nix
    ];
    home.username = "ghost";
    home.homeDirectory = "/home/ghost"; 
    home.stateVersion = "26.05";
  };
  
  environment.systemPackages = with pkgs; [
  ];

}
