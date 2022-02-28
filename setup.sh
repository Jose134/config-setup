#!/bin/bash

# Install software
sudo apt update
sudo apt upgrade

sudo apt install -y vim
sudo apt install -y htop
sudo apt install -y g++
sudo apt install -y cmake
sudo apt install -y make
sudo apt install -y code
sudo apt install -y vlc
sudo apt install -y filezilla
sudo apt install -y discord
sudo apt install -y neofetch
sudo apt install -y nodejs
sudo apt install -y gnome-shell-extensions

flatpak install flathub com.google.AndroidStudio
flatpak install flathub com.axosoft.GitKraken

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
unzip 2022-01-25.zip
cd Tela-icon-theme-2022-01-25
./install.sh
cd ..
gsettings set org.gnome.desktop.interface icon-theme 'Tela-dark'

rm -rf Tela-icon-theme-2022-01-25
rm Tela-icon-theme-2022-01-25.zip

# FiraCode Nerd Font
mkdir ~/.fonts

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip
cp *.ttf ~/.fonts
cp *.otf ~/.fonts
fc-cache -fv

rm FiraCode.zip
rm *.ttf *.otf

# Wallpaper
mkdir ~/Pictures/Wallpaper
cp wallpaper/1080p.jpg ~/Pictures/Wallpaper
gsettings set org.gnome.desktop.background picture-uri file:///home/$USER/Pictures/Wallpaper/1080p.jpg
gsettings set org.gnome.desktop.background picture-options 'zoom'

# Login Wallpaper
sudo mkdir /usr/share/backgrounds/darkbird
sudo cp wallpaper/WallpaperLock.png /usr/share/backgrounds/darkbird

# Extra GNOME configuration
gsettings set org.gnome.desktop.interface clock-show-seconds true

# Kitty Terminal
sudo apt install -y kitty
gsettings set org.gnome.desktop.default-applications.terminal exec '/usr/bin/kitty'

# Fish shell
sudo apt install -y fish
chsh -s /usr/bin/fish

# Oh-my-posh
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

mkdir ~/.poshthemes
cp poshthemes/DarkBird.omp.json ~/.poshthemes

# Config files
mv config/* ~/.config/

# GDM3 config
sudo cp /etc/gdm3/greeter.dconf-defaults /etc/gdm3/greeter.dconf-defaults-backup
sudo cp gdm/greeter.dconf-defaults /etc/gdm3/greeter.dconf-defaults
sudo cp /usr/share/gnome-shell/theme/Pop/gnome-shell-theme.gresource /usr/share/gnome-shell/theme/Pop/gnome-shell-theme.gresource.back
sudo cp gdm/gnome-shell-theme.gresource /usr/share/gnome-shell/theme/Pop/gnome-shell-theme.gresource

# GNOME Shell extensions
mv sound-output-device-chooser@kgshank.net ~/.local/gnome-shell/extensions/sound-output-device-chooser@kgshank.net
gnome-extensions enable sound-output-device-chooser@kgshank.net
