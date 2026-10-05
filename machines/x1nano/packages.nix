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
    pkgs.android-tools
    android-file-transfer   # mount:`aft-mtp-mount ~/mnt-phone` umount:`fusermount -u ~/mnt-phone`
  ];
}
