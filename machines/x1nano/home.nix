{  config, ... }:
let
  machine_files = "${config.home.homeDirectory}/.nix-config/machines/x1nano";
in
{
  # folders
  home.file = {
    ".config/autorandr".source = config.lib.file.mkOutOfStoreSymlink "${machine_files}/autorandr";
  };

}
