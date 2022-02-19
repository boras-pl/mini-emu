#!/bin/bash

apt update
apt upgrade
apt install -y sudo
usermod -aG sudo emu
usermod -aG input emu
