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

  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
  };

  # Enable firmware updates
  hardware.enableRedistributableFirmware = true;

  # fwupdmgr get-updates
  # sudo fwupdmgr update
  services.fwupd.enable = true;
  
  # Enable bluetooth
  hardware.bluetooth.enable = true;

  services.blueman.enable = true;

  # Workaround to make Bose QC work https://github.com/bluez/bluez/issues/2280
  environment.etc."wireplumber/wireplumber.conf.d/99-bluez-a2dp-source.conf".text = ''
    monitor.bluez.properties = {
      bluez5.roles = [ a2dp_source hsp_ag hfp_ag ]
    }
  '';

  # Thermals and power management
  services.thermald.enable = true;
  services.tlp.enable = true;
  
  environment.systemPackages = with pkgs; [
  ];

}
