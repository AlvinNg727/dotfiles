#!/bin/bash

# Update packages
pacman -Syu

# git
pacman -S git github-cli

# nerd fonts
pacman -S ttf-cascadia-code-nerd

# stuff i use
pacman -S fish alacritty neovim discord neofetch btop playerctl openssh rustup steam brightnessctl light bat firefox wl-clipboard xdg-user-dirs thunar file-roller thunar-archive-plugin tumbler eza bc
rustup default stable
$1 -S ani-cli-git trackma-git brave-bin emote

# hyprland
# $1 -S hyprland-git xdg-desktop-portal-hyprland-git xdg-desktop-portal-gtk hyprlock-git hyprlang-git hyprwayland-scanner-git hyprcursor-git hyprpaper-git hypridle-git

# nwg-look
# $1 -S nwg-look

# waybar
# $1 -S waybar

# dunst
# $1 -S dunst libnotify

# rofi
# $1 -S rofi-wayland

# fonts
pacman -S noto-fonts noto-fonts-emoji noto-fonts-cjk

# starship
pacman -S starship

# theme shit
sudo pacman -S materia-gtk-theme
$1 -S papirus-icon-theme-git xcursor-simp1e-dark
