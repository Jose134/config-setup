#!/bin/bash

# Install software
sudo apt update
sudo apt upgrade

sudo apt install -y vim
sudo apt install -y g++
sudo apt install -y cmake
sudo apt install -y make
sudo apt install -y git
sudo apt install -y code
sudo apt install -y vlc
sudo apt install -y filezilla
sudo apt install -y discord
sudo apt install -y neofetch
sudo apt install -y nodejs

# Orchis GTK theme
wget https://github.com/vinceliuice/Orchis-theme/archive/refs/tags/2021-12-13.zip
unzip 2021-12-13.zip
cd Orchis-theme-2021-12-13
./install.sh -t default
cd ..
gsettings set org.gnome.desktop.interface gtk-theme 'Orchis-dark'

rm -rf Orchis-theme-2021-12-13
rm 2021-12-13.zip

# Twilight cursors theme
git clone https://github.com/yeyushengfan258/Twilight-Cursors.git
cd Twilight-Cursors
./install.sh
cd ..
gsettings set org.gnome.desktop.interface cursor-theme 'Twilights-cursors'

rm -rf Twilight-Cursors

# Tela icon theme
wget https://github.com/vinceliuice/Tela-icon-theme/archive/refs/tags/2022-01-25.zip
unzip Tela-icon-theme-2022-01-25.zip
cd Tela-icon-theme-2022-01-25
./install.sh
cd ..
gsettings set org.gnome.desktop.interface icon-theme 'Tela-dark'

rm -rf Tela-icon-theme-2022-01-25
rm Tela-icon-theme-2022-01-25.zip


# Wallpaper
mkdir ~/Pictures/Wallpaper
cp img/1080p.jpg ~/Pictures/Wallpaper
gsettings set org.gnome.desktop.background picture-uri file:///home/$USER/Pictures/Wallpaper/1080p.jpg

