#!/bin/bash

sudo pacman -Syu

# Git
sudo pacman -S --needed git github-cli git-delta

# Setup paru
sudo pacman -S --needed base-devel rustup
rustup default stable
cd ~ && git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ~ && rm -rf paru

# Setup audio (fix audio for yoga pro 9i D:)
sudo cp ~/dotfiles/yoga_speaker/yoga-16imh9-speakers.service /etc/systemd/system/
paru -S --needed i2c-tools
sudo cp ~/dotfiles/yoga_speaker/2pa-byps.sh /usr/local/bin/
sudo systemctl daemon-reload
sudo systemctl enable --now yoga-16imh9-speakers.service
sudo cp ~/dotfiles/yoga_speaker/disable-hda-power-save.conf /etc/modprobe.d/

# Setup bluetooth
paru -S --needed blueman \
    bluez \
    bluez-utils
sudo systemctl enable --now bluetooth.service

# General stuff
paru -S --needed bat \
    btop \
    eza \
    fastfetch \
    fd \
    firefox \
    fish \
    imagemagick \
    man-db \
    neovim \
    npm \
    ripgrep \
    starship \
    unzip \
    wezterm-git \
    wget \
    xdg-user-dirs \
    yazi \
    zoxide
cd ~ && xdg-user-dirs-update
cp -r ~/dotfiles/bat ~/.config/
cp -r ~/dotfiles/btop ~/.config/
cp -r ~/dotfiles/fastfetch ~/.config/
cp -r ~/dotfiles/fish ~/.config/
cp -r ~/dotfiles/nvim ~/.config/
cp ~/dotfiles/starship.toml ~/.config/
cp -r ~/dotfiles/wezterm ~/.config/

# Secrets
paru -S --needed gnome-keyring \
    libsecret \
    seahorse

# Window manager
paru -S --needed ani-cli \
    brightnessctl \
    ffmpegthumbnailer \
    file-roller \
    grim \
    hyprland-meta-git \
    mpv \
    network-manager-applet \
    playerctl \
    qt5-wayland \
    qt6-wayland \
    rofi-wayland \
    slurp \
    swaync \
    swayosd-git \
    thunar \
    thunar-archive-plugin \
    tumbler \
    udiskie \
    vesktop-bin \
    waybar \
    wl-clipboard \
    wl-clip-persist \
    xdg-desktop-portal-gtk \
    xorg-xhost
sudo systemctl enable --now swayosd-libinput-backend.service
cp -r ~/dotfiles/hypr ~/.config/
cp -r ~/dotfiles/rofi ~/.config/
cp -r ~/dotfiles/wayland ~/.config/
cp -r ~/dotfiles/wallpaper ~/.config/
cp ~/dotfiles/electron-flags.conf ~/.config/

# Fonts
paru -S --needed noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji \
    ttf-cascadia-code-nerd

# Theming
paru -S --needed nwg-look \
    materia-gtk-theme \
    papirus-icon-theme

# Power
paru -S auto-cpufreq \
    thermald
sudo systemctl enable --now auto-cpufreq
sudo systemctl enable --now thermald.service

# NVIDIA
paru -S --needed cuda \
    egl-wayland \
    lib32-nvidia-utils \
    linux-headers \
    nvidia-open-dkms \
    nvidia-utils \
    nvtop

# Code shit
paru -S --needed docker \
    docker-buildx \
    docker-compose \
    lazydocker-bin \
    lazygit \
    nvidia-container-toolkit \
    openssh \
    python-black \
    uv \
    visual-studio-code-bin
sudo systemctl enable --now docker.socket
cp ~/dotfiles/code-flags.conf ~/.config/

# Others
paru -S --needed prismlauncher \
    steam

# Wallpapers (this may take long time to clone lol)
git clone https://github.com/alvinng727/wallpaper.git ~/.config/wallpaper
