#!/bin/bash

sudo apt update
sudo apt install -y mc
sudo apt install -y gpm
sudo apt install -y alsa-utils

# autologin
sudo cp -r etc/systemd/system/getty@tty1.service.d /etc/systemd/system/

# SDL2
sudo apt install -y git build-essential ccache
sudo apt-get build-dep libsdl2
wget https://www.libsdl.org/release/SDL2-2.0.20.tar.gz
tar xf SDL2-2.0.20.tar.gz
cd SDL2-2.0.20/
./configure --enable-video-kmsdrm --disable-video-wayland --disable-video-x11 --disable-video-vulkan
make -j16
sudo make install
cd
echo 'export LD_LIBRARY_PATH=/usr/local/lib' >> .profile
echo "REBOOT! Do not panic."
sleep  2
sudo reboot
