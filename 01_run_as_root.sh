#!/bin/bash

apt update
apt upgrade
apt install sudo
usermod -aG sudo emu
usermod -aG input emu
