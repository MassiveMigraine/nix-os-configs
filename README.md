# Useful commands
sudo nixos-rebuild dry-build --flake .#x1nano  
sudo nixos-rebuild switch --flake .#x1nano

# Generate hardware-configuration.nix
su -  
nixos-generate-config --show-hardware-config > /home/ghost/.nix-configs/machines/<machine>/hardware-configuration.nix
