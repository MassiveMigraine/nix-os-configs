# Useful commands
sudo nixos-rebuild dry-build --flake .#x1nano  
sudo nixos-rebuild switch --flake .#x1nano

nix-shell -p git vim

# Generate hardware-configuration.nix
su -  
nixos-generate-config --show-hardware-config > /home/ghost/.nix-configs/machines/<machine>/hardware-configuration.nix


# New Machine / Install
Update flake.nix

nix-shell -p git vim
git clone <gitrepo>/nix-os-configs /home/<user>/.nix-configs
git clone <gitrepo>/dotfiles /home/<user>/.dotfiles

su -
nixos-generate-config --show-hardware-config > /home/<user>/.nix-configs/machines/<machine>/hardware-configuration.nix
