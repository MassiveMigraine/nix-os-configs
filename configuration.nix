{ pkgs, ... }:
{
  imports =
    [ 
      ./packages.nix
    ];

  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Set fonts
  fonts = { 
    packages = with pkgs; [
      dejavu_fonts
    ];  

    fontconfig = { 
      enable = true;
      defaultFonts = { 
      monospace = [ "DejaVu Sans Mono" ];
      };  
    };  
  };

  #boot.blacklistedKernelModules = [ "pcspkr" ];

  # Needed for nix-shell -p
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable X
  services.xserver = { 
    enable = true;
    windowManager.openbox.enable = true;
    displayManager.lightdm.enable = true;
  };  
  
  # Enable sound
  services.pipewire = { 
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };  

  # Enable gvfs for PCManFM (network SSH shares)
  services.gvfs = { 
    enable = true;
  };  

  # Enable gnome-keyring for Nextcloud saved creds
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;

  system.stateVersion = "26.05";

}
