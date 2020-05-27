#!/bin/bash -e
on_chroot << EOF
  cd /home/pi/
  git clone https://github.com/raspberryenvoie/piRa1n.git
  cd piRa1n
  ./install_piRa1n.sh
  chown -R pi:pi /home/pi/piRa1n/
  chmod -R 755 /home/pi/piRa1n/
EOF
