#!/bin/bash

sudo apt install -y curl
echo 'deb http://download.opensuse.org/repositories/home:/FrodeSolheim:/stable/Debian_11/ /' | sudo tee /etc/apt/sources.list.d/home:FrodeSolheim:stable.list
curl -fsSL https://download.opensuse.org/repositories/home:FrodeSolheim:stable/Debian_11/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_FrodeSolheim_stable.gpg > /dev/null
sudo apt update
sudo apt install -y fs-uae
mkdir -p FS-UAE/Floppies
cd FS-UAE/Floppies
wget http://ftp.amigascne.org/pub/amiga/Groups/S/Spaceballs/Spaceballs-StateOfTheArt.dms
cd ../..
cp -r FS-UAE ~/
cp fs-uae-start.sh ~/
echo '. "$HOME/fs-uae-start.sh"' >> ~/.profile
cd
echo "FS-UAE will start automatically after every reboot."
