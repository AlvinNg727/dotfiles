#!/bin/bash

git() {
    paru -R hyprland aquamarine hyprcursor hyprlang hyprutils hyprwayland-scanner xdg-desktop-portal-hyprland hyprlock hypridle hyprpaper
    paru -S hyprland-git aquamarine-git hyprcursor-git hyprlang-git hyprutils-git hyprwayland-scanner-git xdg-desktop-portal-hyprland-git hyprlock-git hypridle-git hyprpaper-git
}

pacman() {
    paru -R hyprland-git aquamarine-git hyprcursor-git hyprlang-git hyprutils-git hyprwayland-scanner-git xdg-desktop-portal-hyprland-git hyprlock-git hypridle-git hyprpaper-git
    paru -S hyprland aquamarine hyprcursor hyprlang hyprutils hyprwayland-scanner xdg-desktop-portal-hyprland hyprlock hypridle hyprpaper
}

case "$1" in
    git) git;;
    pacman) pacman;;
esac
