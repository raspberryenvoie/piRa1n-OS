#!/bin/bash -e
on_chroot << EOF
  apt update
  apt upgrade -y
  cd /home/pira1n/
  git clone https://github.com/raspberryenvoie/piRa1n.git
  cd piRa1n/
  wget https://assets.checkra.in/downloads/linux/cli/arm/dde0ee4255403a427636bb76e09e409487f8be128af4b7d89fac78548bd5b35a/checkra1n -O /home/pira1n/piRa1n/piRa1n #Download Checkra1n
  cd /home/pira1n/piRa1n/
  echo "#!/bin/sh
sudo /home/pira1n/piRa1n/piRa1n -c -E
sudo /sbin/shutdown now" > piRa1n.sh
  chmod +x piRa1n piRa1n.sh #Make scripts executable
  #The following commands will enable piRa1n at startup
  echo " [Unit]
 Description=Checkra1n
 After=multi-user.target
 [Service]
 ExecStart=/home/pira1n/piRa1n/piRa1n.sh
 [Install]
 WantedBy=multi-user.target" | sudo tee /etc/systemd/system/piRa1n.service
  chmod 644 /etc/systemd/system/piRa1n.service
  systemctl daemon-reload
  systemctl enable piRa1n.service
  chown -R pira1n:pira1n /home/pira1n/piRa1n/
  chmod -R 755 /home/pira1n/piRa1n/
EOF
