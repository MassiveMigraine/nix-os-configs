{ pkgs, ...}:
{
  programs.tmux.enable = true;

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    openbox
    pkgs.obconf
    pavucontrol
    tint2
    rofi
    pcmanfm
    feh
    rxvt-unicode
    vim-full
    tree
    btop
    arandr
    seahorse # used to not need to login for gnome keyring (because yolo)
    dunst
    libnotify
  ];
}
