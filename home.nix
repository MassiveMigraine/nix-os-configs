{ config, ... }:
let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in
{

  home.file = {
    # files
    ".bashrc".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.bashrc";
    ".bash_aliases".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.bash_aliases";
    ".vimrc".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.vimrc";
    ".gvimrc".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.gvimrc";
    ".tmux.conf".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.tmux.conf";
    ".config/tint2/tint2rc".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.config/tint2/tint2rc";
    ".Xresources".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.Xresources";

    # folders
    ".vim".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.vim";
    ".config/openbox".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.config/openbox";
    ".themes".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.themes";
    ".local/share/remmina".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/.local/share/remmina";
  };

}
