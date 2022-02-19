# This is a set of helper scripts that allow you to run FS-UAE, DosBox and Vice C64 on minimal Debian w/o X11
Print this tutorial, seriously! Or open it on your smartphone, at least.

1. Download, burn and install any modern Debian netinst (Bullseye or daily) e.g. debian-testing-amd64-netinst.iso
2. Important! During installation an user must be set to: emu
Install only standard system utilities. SSH is optional for remote administration.
DO NOT install any windowing (Gnome, etc.) systems.
See attached screenshots if any doubts.
3. Boot and login as emu
4. Execute commands
```
# It switches to root
su -
apt update
apt upgrade
apt install git
exit

# now we are back to emu
git clone https://github.com/boras-pl/mini-emu.git

# switch to root again
su -
/home/emu/mini-emu/01_run_as_root.sh 
exit

# logout emu to activate sudo group
exit
```
5. Login as emu and execute commands
```
cd mini-emu
./02_system.sh
./03_fs-uae.sh 
# and optionally a PC DOS emulator:
./04_dosbox.sh
```
Known issues:
- it is not possible to run fs-uae-launcher, so any configs must be prepared manually or on another system.
- 60Hz only - I can not set 50Hz via KMS/DRM, yet.
- there is a bug when some (e.g. RTX) nvidia cards are used: black screen when we close an application, that is why I put 'clear' in the starting script.
- black screen on Vice C64 on nvidia cards. It should work on Intel iGPU
- no idea how it works on Radeon cards.
