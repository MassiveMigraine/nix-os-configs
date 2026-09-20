{ pkgs, ...}:
{
  programs.firefox.enable = true;
  programs.tmux.enable = true;

  programs.git = {
    enable = true;
    config = {
      init = {
        defaultBranch = "main";
      };
      user = {
        name = "MassiveMigraine";
        email = "MassiveMigraine@gmail.com";
      };
    };
  };

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
