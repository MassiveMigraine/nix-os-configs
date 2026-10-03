{  config, machineSpecificdotFiles, ... }:
{
  # machine specific .dotfiles/<machineName> files
  home.file = {
    ".bash_aliases".source =
        config.lib.file.mkOutOfStoreSymlink "${machineSpecificdotFiles}/.bash_aliases";

    ".config/autorandr".source =
        config.lib.file.mkOutOfStoreSymlink "${machineSpecificdotFiles}/.config/autorandr";

    ".local/share/remmina".source =
        config.lib.file.mkOutOfStoreSymlink "${machineSpecificdotFiles}/.local/share/remmina";
  };
}
