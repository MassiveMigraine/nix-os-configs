{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    autorandr
    pasystray
    bluez
    remmina
    vscode
    nextcloud-client
    keepassxc
    spotify
  ];
}