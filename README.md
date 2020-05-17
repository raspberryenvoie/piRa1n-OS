# piRa1n-OS
an OS for Raspberry Pi 4 based on Raspbian dedicated to jailbreak with Checkra1n

## Build yourself piRa1n-OS
To install the required dependencies for pi-gen you should run:
```bash
apt-get install coreutils quilt parted qemu-user-static debootstrap zerofree zip \
dosfstools bsdtar libcap2-bin grep rsync xz-utils file git curl bc
```
Run `git clone https://github.com/raspberryenvoie/piRa1n-OS.git && cd piRa1n-OS`\
Then, build the image by runing `sudo ./build.sh`\
More informations can be found [here](https://github.com/RPi-Distro/Pi-gen)

## How to use piRa1n OS? And link to download built image of piRa1n-OS
Check [this link](https://github.com/raspberryenvoie/piRa1n).

## Credits:
- [pi-gen](https://github.com/RPi-Distro/Pi-gen)
- [Checkra1n](https://checkra.in)
- [Raspbian](https://www.raspberrypi.org/downloads/raspbian/)
