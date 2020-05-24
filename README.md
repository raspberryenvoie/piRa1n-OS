# piRa1n-OS
piRa1n-OS is an OS based on Raspbian with [piRa1n](https://github.com/raspberryenvoie/piRa1n) pre-installed.

## How to use piRa1n? And link to download built image of piRa1n-OS
Check [this link](https://github.com/raspberryenvoie/piRa1n) for instructions on how to use piRa1n.\
The default username of piRa1n-OS is `pira1n` and the password is `jailbreak`.

Download link: New build coming in few minutes \
SHA256: 

## Build yourself piRa1n-OS
The tool used to build piRa1n-OS (pi-gen) supports Debian Buster and Ubuntu Xenial. More informations on pi-gen can be found [here](https://github.com/RPi-Distro/Pi-gen).

To install the required dependencies for pi-gen you should run:
```bash
apt-get install coreutils quilt parted qemu-user-static debootstrap zerofree zip \
dosfstools bsdtar libcap2-bin grep rsync xz-utils file git curl bc
```
Run `git clone https://github.com/raspberryenvoie/piRa1n-OS.git && cd piRa1n-OS`.\
Then, build the image by runing `sudo ./build.sh`.\
Once this process is done, you will find the image in `piRa1n-OS/work/date-piRa1n-OS/export-image`.

## Credits:
- [pi-gen](https://github.com/RPi-Distro/Pi-gen)
- [Checkra1n](https://checkra.in)
- [Raspbian](https://www.raspberrypi.org/downloads/raspbian/)
