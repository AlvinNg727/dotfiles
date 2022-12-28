#!/bin/bash

#Update packages
sudo pacman -Syu

#git
sudo pacman -S git

#paru
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
rm -rf paru

#nerd fonts
paru -S nerd-fonts-jetbrains-mono nerd-fonts-cascadia-code

#stuff i use
sudo pacman -S fish alacritty neovim discord libreoffice-still neofetch btop playerctl rustup steam
rustup default stable
paru -S brave-bin emote

#swaylock
#yay -S swaylock-effects-git

#fonts
#sudo pacman -S ttf-cascadia-code

#starship
sudo pacman -S starship
#sh -c "$(curl -fsSL https://starship.rs/install.sh)"

#install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#tela icon theme
curl -OL https://github.com/vinceliuice/Tela-icon-theme/archive/refs/tags/2021-10-08.tar.gz
tar -xzvf 2021-10-08.tar.gz
rm 2021-10-08.tar.gz
cd Tela-icon-theme-2021-10-08
./install.sh -a
cd ..
rm -rf Tela-icon-theme-2021-10-08

#orchis theme
curl -OL https://github.com/vinceliuice/Orchis-theme/archive/refs/tags/2021-10-16.tar.gz
tar -xzvf 2021-10-16.tar.gz
rm 2021-10-16.tar.gz
cd Orchis-theme-2021-10-16
./install.sh -t grey --tweaks black
cd ..
rm -rf Orchis-theme-2021-10-16
