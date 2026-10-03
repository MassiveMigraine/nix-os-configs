{ config, allMachinedotFiles, machineSpecificdotFiles, ... }:
{
  home.file = {
    # files
    ".bashrc".source = config.lib.file.mkOutOfStoreSymlink "${allMachinedotFiles}/.bashrc";
    ".vimrc".source = config.lib.file.mkOutOfStoreSymlink "${allMachinedotFiles}/.vimrc";
    ".gvimrc".source = config.lib.file.mkOutOfStoreSymlink "${allMachinedotFiles}/.gvimrc";
    ".tmux.conf".source = config.lib.file.mkOutOfStoreSymlink "${allMachinedotFiles}/.tmux.conf";
    ".config/tint2/tint2rc".source = config.lib.file.mkOutOfStoreSymlink "${allMachinedotFiles}/.config/tint2/tint2rc";
    ".Xresources".source = config.lib.file.mkOutOfStoreSymlink "${allMachinedotFiles}/.Xresources";

    ".config/openbox".source =
        config.lib.file.mkOutOfStoreSymlink "${allMachinedotFiles}/.config/openbox";

    # folders
    ".vim".source = config.lib.file.mkOutOfStoreSymlink "${allMachinedotFiles}/.vim";
    ".themes".source = config.lib.file.mkOutOfStoreSymlink "${allMachinedotFiles}/.themes";
  };

}
