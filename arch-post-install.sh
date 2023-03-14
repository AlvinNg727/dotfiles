#!/bin/bash

#Update packages
pacman -Syu

#git
pacman -S git

#nerd fonts
pacman -S ttf-jetbrains-mono-nerd otf-cascadia-code-nerd

#stuff i use
pacman -S fish alacritty neovim discord neofetch btop playerctl rustup steam brightnessctl light ripgrep bat firefox
rustup default stable
$1 -S nwg-look-bin ani-cli-git dell-bios-fan-control-git trackma-git brave-bin emote

#dunst
#yay -S dunst

#wallpaper
#yay -S swww

#swaylock
#yay -S swaylock-effects-git

#rofi
#yay -S --mflags "--nocheck" rofi-lbonn-wayland

#fonts
#sudo pacman -S ttf-cascadia-code noto-fonts noto-fonts-emoji

#starship
pacman -S starship
#sh -c "$(curl -fsSL https://starship.rs/install.sh)"

#theme shit
sudo pacman -S materia-gtk-theme
$1 -S papirus-folders-git papirus-icon-theme xcursor-simp1e-dark
