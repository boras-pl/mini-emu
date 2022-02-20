#!/bin/bash -e

apt update
apt upgrade
apt install -y sudo

useradd -m -s /bin/bash emu
passwd emu
usermod -aG sudo emu
usermod -aG input emu

apt install -y mc
apt install -y gpm
apt install -y alsa-utils

# autologin
cp -r etc/systemd/system/getty@tty1.service.d /etc/systemd/system/

# SDL2
apt install -y git build-essential ccache
apt-get build-dep -y libsdl2
wget https://www.libsdl.org/release/SDL2-2.0.20.tar.gz
tar xf SDL2-2.0.20.tar.gz
cd SDL2-2.0.20/
./configure --enable-video-kmsdrm --disable-video-wayland --disable-video-x11 --disable-video-vulkan
make -j16
make install
echo 'export LD_LIBRARY_PATH=/usr/local/lib' >> /home/emu/.profile

#FS-UAE
apt install -y curl
echo 'deb http://download.opensuse.org/repositories/home:/FrodeSolheim:/stable/Debian_11/ /' | sudo tee /etc/apt/sources.list.d/home:FrodeSolheim:stable.list
curl -fsSL https://download.opensuse.org/repositories/home:FrodeSolheim:stable/Debian_11/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_FrodeSolheim_stable.gpg > /dev/null
apt update
apt install -y fs-uae
cd $HOME/mini-emu/
mkdir -p FS-UAE/Floppies
cd FS-UAE/Floppies
wget http://ftp.amigascne.org/pub/amiga/Groups/S/Spaceballs/Spaceballs-StateOfTheArt.dms
cd ../..
cp -r FS-UAE /home/emu/
cp fs-uae-start.sh /home/emu/
chown -R emu:emu /home/emu/FS-UAE
chown    emu:emu /home/emu/fs-uae-start.sh

echo '. "$HOME/fs-uae-start.sh"' >> /home/emu/.profile
echo "FS-UAE will start automatically after every reboot."

apt install -y libsdl2-net-2.0-0
apt install -y libopusfile0
cd $HOME/mini-emu/
wget https://github.com/dosbox-staging/dosbox-staging/releases/download/v0.78.1/dosbox-staging-linux-v0.78.1.tar.xz
cd /home/emu/
tar xf $HOME/mini-emu/dosbox-staging-linux-v0.78.1.tar.xz
chown -R emu:emu dosbox-staging-linux-v0.78.1

VICE_VER=3.6.1
sudo apt install -y flex bison xa65 dos2unix libsdl2-image-dev libpng-dev
cd $HOME/mini-emu/
wget https://altushost-swe.dl.sourceforge.net/project/vice-emu/releases/vice-${VICE_VER}.tar.gz
tar xf vice-${VICE_VER}.tar.gz
cd vice-${VICE_VER}/
#as we have alsa, we do not need pulse
./configure --without-pulse --disable-pdf-docs
make -j16
make install

echo "REBOOT! Do not panic."
sleep  2
reboot

