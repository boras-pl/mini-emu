#!/bin/bash

VICE_VER=3.6.1
sudo apt install flex bison xa65 dos2unix libsdl2-image-dev
wget https://altushost-swe.dl.sourceforge.net/project/vice-emu/releases/vice-${VICE_VER}.tar.gz
tar xf vice-${VICE_VER}.tar.gz
cd vice-${VICE_VER}/
#as we have alsa, we do not need pulse
./configure --without-pulse --disable-pdf-docs
make -j16
sudo make install
