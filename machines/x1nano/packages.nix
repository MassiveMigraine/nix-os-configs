{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    autorandr
    brightnessctl
    pasystray
    bluez
    remmina
    vscode
    nextcloud-client
    keepassxc
    spotify
  ];
}