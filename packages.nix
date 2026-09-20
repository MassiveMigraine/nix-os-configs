{ pkgs, ...}:
{
  programs.firefox.enable = true;
  programs.git.enable = true;
  programs.tmux.enable = true;

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    openbox
    pkgs.obconf
    tint2
    rofi
    pcmanfm
    pavucontrol
    pasystray
    vim-full
    tree
    rxvt-unicode
    keepassxc
    arandr
    autorandr
    nextcloud-client
    remmina
    vscode
  ];
}
