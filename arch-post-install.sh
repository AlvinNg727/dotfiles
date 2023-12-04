#!/bin/bash

#Update packages
pacman -Syu

#git
pacman -S git

#nerd fonts
pacman -S ttf-jetbrains-mono-nerd ttf-cascadia-code-nerd

#stuff i use
pacman -S fish alacritty neovim discord neofetch btop playerctl rustup steam brightnessctl light ripgrep bat firefox wl-clipboard xdg-user-dirs thunar
rustup default stable
$1 -S nwg-look-bin ani-cli-git dell-bios-fan-control-git trackma-git brave-bin emote i8kutils

# hyprland
#$1 -S hyprland-git

# waybar
#$1 -S waybar-hyprland-git
# CPU TEMP NEED MOVE TEMPERATURE.SERVICE FILE TO /USR/LIB/SYSTEMD/SYSTEM/

#dunst
#$1 -S dunst

#wallpaper
#$1 -S swww

#swaylock
#$1 -S swaylock-effects-git

#rofi
#$1 -S --mflags "--nocheck" rofi-lbonn-wayland

#fonts
sudo pacman -S noto-fonts noto-fonts-emoji noto-fonts-cjk

#starship
pacman -S starship
#sh -c "$(curl -fsSL https://starship.rs/install.sh)"

#theme shit
sudo pacman -S materia-gtk-theme
$1 -S papirus-folders-git papirus-icon-theme-git xcursor-simp1e-dark
