#!/bin/bash
sudo apt update
sudo apt -y install  gnome-packagekit packagekit-tools dconf-editor libnotify-bin plymouth
mkdir -p ~/.local/bin/
if ! [ -e ~/.local/bin/ ]; then
  mkdir -p ~/.local/bin/
fi
cp ./debian-updater* ~/.local/bin/
systemctl --user enable apt-autoupdate-refresh.timer 
systemctl --user enable apt-autoupdate-update.timer
systemctl --user start apt-autoupdate-refresh.timer 
systemctl --user start apt-autoupdate-update.timer
