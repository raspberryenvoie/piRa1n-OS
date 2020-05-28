#!/bin/bash -e
on_chroot << EOF
  curl -sk https://raw.githubusercontent.com/raspberryenvoie/piRa1n/beta/install_piRa1n.sh | sh
  chown -R pi:pi /home/pi/piRa1n/
  chmod -R 755 /home/pi/piRa1n/
  curl -sk https://raw.githubusercontent.com/raspberryenvoie/piRa1n-web/master/install_piRa1n-web.sh | bash
  chown -R pi:pi /home/pi/piRa1n-web/
  chmod -R 755 /home/pi/piRa1n-web/
EOF
