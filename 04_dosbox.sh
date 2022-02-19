#!/bin/bash

sudo apt install -y libsdl2-net-2.0-0
sudo apt install -y libopusfile0
wget https://github.com/dosbox-staging/dosbox-staging/releases/download/v0.78.1/dosbox-staging-linux-v0.78.1.tar.xz

cd
tar xf ./mini-emu/dosbox-staging-linux-v0.78.1.tar.xz
