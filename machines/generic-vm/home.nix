{  config, ... }:
let
  machine_files = "${config.home.homeDirectory}/.nix-config/machines/generic-vm";
in
{
  # folders
  home.file = {
    ".config/autorandr".source = config.lib.file.mkOutOfStoreSymlink "${machine_files}/autorandr";
  };

}
