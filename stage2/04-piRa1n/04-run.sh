#!/bin/bash -e
on_chroot << EOF
  apt update
  apt upgrade -y
  cd /home/pira1n/
  git clone https://github.com/raspberryenvoie/piRa1n.git
  cd piRa1n/
  wget https://assets.checkra.in/downloads/linux/cli/arm/1ed46fb34c72ee942a1af185fd5347b999f4bba667d594dd56554e3b3d3ea417/checkra1n-armel -O /home/pira1n/piRa1n/piRa1n #Download Checkra1n
  cd /home/pira1n/piRa1n/
  echo "#!/bin/sh
sudo /home/pira1n/piRa1n/piRa1n -c -E
sudo /sbin/shutdown now" > piRa1n.sh
  chmod +x install_piRa1n.sh piRa1n piRa1n.sh update_checkra1n.sh uninstall_piRa1n.sh piRa1n_no_automatic_shutdown.sh piRa1n_automatic_shutdown.sh piRa1n_safe_mode.sh
  chown pira1n:pira1n /home/pira1n/piRa1n/*
  chmod 755 /home/pira1n/piRa1n/*
  #The following commands will enable piRa1n at startup
  echo " [Unit]
 Description=Checkra1n
 After=multi-user.target
 [Service]
 ExecStart=/home/pira1n/piRa1n/piRa1n.sh
 [Install]
 WantedBy=multi-user.target" | sudo tee /lib/systemd/system/piRa1n.service
  chmod 644 /lib/systemd/system/piRa1n.service
  systemctl daemon-reload
  systemctl enable piRa1n.service
EOF
