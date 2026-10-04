{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    autorandr
    pasystray
    bluez
    remmina
    nextcloud-client
    keepassxc
    spotify
  ];
}