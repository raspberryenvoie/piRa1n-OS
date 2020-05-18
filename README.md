# piRa1n-OS
An OS for Raspberry Pi 4 based on Raspbian dedicated to jailbreak with Checkra1n.

## How to use piRa1n? And link to download built image of piRa1n-OS
Check [this link](https://github.com/raspberryenvoie/piRa1n) for instructions on how to use piRa1n.

Download link: https://drive.google.com/open?id=1CmfNFcQgfx9T_o5tPhKs5etPMSFyusf9 \
SHA256: 3f3b91c1e29df4b5d9b2a5485e0297665f7d4b1ee388e397e18da916a7fed1c9

## Build yourself piRa1n-OS
To install the required dependencies for pi-gen you should run:
```bash
apt-get install coreutils quilt parted qemu-user-static debootstrap zerofree zip \
dosfstools bsdtar libcap2-bin grep rsync xz-utils file git curl bc
```
Run `git clone https://github.com/raspberryenvoie/piRa1n-OS.git && cd piRa1n-OS`.\
Then, build the image by runing `sudo ./build.sh`.\
Once this process is done, you will find the image in /piRa1n-OS/work/date-piRa1n-OS-lite/export-image

More informations on how to use pi-gen can be found [here](https://github.com/RPi-Distro/Pi-gen)

## Credits:
- [pi-gen](https://github.com/RPi-Distro/Pi-gen)
- [Checkra1n](https://checkra.in)
- [Raspbian](https://www.raspberrypi.org/downloads/raspbian/)
