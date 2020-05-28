#!/bin/bash -e
on_chroot << EOF
  # Start of the installation of piRa1n
  sudo apt install git usbmuxd -y
  cd /home/pi/
  git clone https://github.com/raspberryenvoie/piRa1n.git
  cd piRa1n/
  wget https://assets.checkra.in/downloads/linux/cli/arm/dde0ee4255403a427636bb76e09e409487f8be128af4b7d89fac78548bd5b35a/checkra1n -O piRa1n #Download Checkra1n
  chmod +x piRa1n #Make piRa1n executable
  #The following commands will enable piRa1n at startup
  echo " [Unit]
 Description=Checkra1n
 After=multi-user.target

 [Service]
 ExecStart=/home/pi/piRa1n/piRa1n.sh

 [Install]
 WantedBy=multi-user.target" | sudo tee /etc/systemd/system/piRa1n.service
  sudo chmod 644 /etc/systemd/system/piRa1n.service
  sudo systemctl daemon-reload
  sudo systemctl enable piRa1n.service
  chown -R pi:pi /home/pi/piRa1n/
  chmod -R 755 /home/pi/piRa1n/
  # End of the installation of piRa1n
  
  # Start of the installation of piRa1n-web
  sudo apt install apache2 php git -y
  sudo sed -i 's/.*DirectoryIndex.*/        DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm/g' /etc/apache2/mods-available/dir.conf
  cd /home/pi/
  git clone https://github.com/raspberryenvoie/piRa1n-web.git
  cd piRa1n-web/
  sudo cp index.php options.php shutdown.php style.css stylesheet.css update.php update_status.php /var/www/html/
  echo -e "\n# piRa1n-web\nwww-data ALL=(ALL) NOPASSWD: /home/pi/piRa1n/config.sh\nwww-data ALL=(ALL) NOPASSWD: /home/pi/piRa1n/shutdown.sh\nwww-data ALL=(ALL) NOPASSWD: /home/pi/piRa1n-web/update.sh\n# End of piRa1n-web" | sudo EDITOR='tee -a' visudo
  chown -R pi:pi /home/pi/piRa1n-web/
  chmod -R 755 /home/pi/piRa1n-web/
  # End of the installation of piRa1n-web
EOF
