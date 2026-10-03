# Nix OS

#### Switch commands
```bash
# test a build before applying
sudo nixos-rebuild dry-build --flake .#x1nano  

# apply a build
sudo nixos-rebuild switch --flake .#x1nano

# or alias if created
x1switch
mediaswitch
```

#### Run program without installing
```bash
# open a shell with git and vim
nix-shell -p git vim

# open a shell and immediately run lsusb
nix-shell -p usbutils --run lsusb
```
#### Garbage collection and deleting old rollbacks
```bash
# delete generations older than 10 days
sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations 10d

#  
sudo nix-collect-garbage

# delete unused store objects
sudo nix-store --gc
```


## New Machine Setup
#### Generate hardware-configuration.nix
```bash
su -  

nixos-generate-config --show-hardware-config > /home/<user>/.nix-configs/machines/<machine>/hardware-configuration.nix
```

#### New Machine / Install
Update flake.nix

nix-shell -p git vim
git clone <gitrepo>/nix-os-configs /home/<user>/.nix-configs
git clone <gitrepo>/dotfiles /home/<user>/.dotfiles

su -
nixos-generate-config --show-hardware-config > /home/<user>/.nix-configs/machines/<machine>/hardware-configuration.nix
