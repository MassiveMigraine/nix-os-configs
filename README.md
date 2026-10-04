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
#### New Machine / Install
1) Update flake.nix with a new `NixosConfigurations.<machine> = makeHost {}`
2) Make a new `.nix-config/machines/<machine>`
3) Use another machine as a template and/or setup new
4) Make a new `.dotfiles/<machine>`

On the new machine:
```bash
    nix-shell -p git

    git clone https://github.com/MassiveMigraine/nix-os-configs.git ~/.nix-config

    git clone https://github.com/MassiveMigraine/dotfiles.git ~/.dotfiles

    cp /etc/nixos/hardware-configuration.nix ~/.nix-configs/machines/<machine>/hardware-configuration.nix

    sudo nixos-rebuild switch --extra-experimental-features 'nix-command flakes' --flake ~/.nix-config/.#<machine>'

    sudo reboot
```


#### Generate hardware-configuration.nix if deleted
```bash
su -  

nixos-generate-config --show-hardware-config > ~/.nix-configs/machines/<machine>/hardware-configuration.nix
```