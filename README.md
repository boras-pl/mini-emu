# This is a set of helper scripts that allow you to run FS-UAE, DosBox and Vice C64 on minimal Debian w/o X11
Print this tutorial, seriously! Or open it on your smartphone, at least.

1. Download, burn and install any modern Debian netinst (Bullseye or daily) e.g. debian-testing-amd64-netinst.iso
2. Important! During installation an user MUST NOT be set to: emu, any other is allowed
- The 'emu' user is created automatically
- Install only standard system utilities. SSH is optional for remote administration.
- DO NOT install any windowing (Gnome, etc.) systems.
See attached screenshots if any doubts.
3. Boot and login as root
4. Execute commands
```
# It switches to root
apt update
apt upgrade
apt install git
git clone https://github.com/boras-pl/mini-emu.git
cd mini-emu
./01_run_as_root.sh
```
5. After reboot it automatically starts FS-UAE and a sample demo

Known issues:
- it is not possible to run fs-uae-launcher, so any configs must be prepared manually or on another system.
- 60Hz only - I can not set 50Hz via KMS/DRM, yet.
- there is a bug when some (e.g. RTX) nvidia cards are used: black screen when we close an application, that is why I put 'clear' in the starting script.
- black screen on Vice C64 on nvidia cards. It should work on Intel iGPU
- no idea how it works on Radeon cards.
