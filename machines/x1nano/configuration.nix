{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set hostname
  networking.hostName = "ghost-laptop"; # Define your hostname.

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

  # Disable Mouse Accel
  environment.etc."X11/xorg.conf.d/90-disable-mouse-accel.conf".source =
    ./90-disable-mouse-accel.conf;

  #hardware.graphics = {
  #  enable = true;
  #  enable32Bit = true;
  #};

  # Enable firmware updates
  hardware.enableRedistributableFirmware = true;

  # fwupdmgr get-updates
  # sudo fwupdmgr update
  services.fwupd.enable = true;
  
  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # Thermals and power management
  services.thermald.enable = true;
  services.tlp.enable = true;
  
  environment.systemPackages = with pkgs; [
  ];

}
