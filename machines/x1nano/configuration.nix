{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable firmware updates
  hardware.enableRedistributableFirmware = true;

 # Thermals and power management
  services.thermald.enable = true;
  services.tlp.enable = true;

  # sudo fwupdmgr get-updates
  # sudo fwupdmgr update
  services.fwupd.enable = true;

   # Set mouse sens
  environment.etc."X11/xorg.conf.d/90-mouse-sens.conf".source =
    ./90-mouse-sens.conf; 

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Enable smartcard for Yubico Authenticator / OTP / PIV
  services.pcscd.enable = true;

  # Workaround to make Bose QC work https://github.com/bluez/bluez/issues/2280
  environment.etc."wireplumber/wireplumber.conf.d/99-bluez-a2dp-source.conf".text = ''
    monitor.bluez.properties = {
      bluez5.roles = [ a2dp_source hsp_ag hfp_ag ]
    }
  '';

  # Enable dconf GNOME database to save blueman config
  programs.dconf.profiles.user.databases = [
      {
        # turn off bluetooth connection notification
        settings."org/blueman/general" = {
          plugin-list = [ "!ConnectionNotifier" ];
        };
      }
    ];

  system.stateVersion = "26.05";

}
