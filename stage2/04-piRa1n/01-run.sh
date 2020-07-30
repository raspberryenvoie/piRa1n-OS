#!/bin/bash -e
# Compile libirecovery
git clone https://github.com/libimobiledevice/libirecovery.git ${ROOTFS_DIR}/home/pi/libirecovery/
on_chroot << EOF
cd /home/pi/libirecovery/
./autogen.sh
cd /home/pi/libirecovery/
make
make install
ldconfig
EOF
rm -rf ${ROOTFS_DIR}/home/pi/libirecovery/
# Start of the installation of piRa1n
git clone https://github.com/raspberryenvoie/piRa1n.git ${ROOTFS_DIR}/home/pi/piRa1n/
wget https://assets.checkra.in/downloads/linux/cli/arm/dde0ee4255403a427636bb76e09e409487f8be128af4b7d89fac78548bd5b35a/checkra1n -O ${ROOTFS_DIR}/home/pi/piRa1n/checkra1n # Download Checkra1n
chmod +x ${ROOTFS_DIR}/home/pi/piRa1n/checkra1n
# The following commands will enable piRa1n at startup
echo '[Unit]
Description=piRa1n
After=multi-user.target

[Service]
ExecStart=/home/pi/piRa1n/piRa1n.sh
StandardOutput=file:/var/log/piRa1n.log
StandardError=file:/var/log/piRa1n.log

[Install]
WantedBy=multi-user.target' > ${ROOTFS_DIR}/etc/systemd/system/piRa1n.service
chmod 644 ${ROOTFS_DIR}/etc/systemd/system/piRa1n.service
on_chroot << EOF
systemctl enable piRa1n.service
chown -R pi:pi /home/pi/piRa1n/
EOF
chmod -R 755 ${ROOTFS_DIR}/home/pi/piRa1n/
# End of the installation of piRa1n
# Start of the installation of piRa1n-web
sed -i 's/.*DirectoryIndex.*/        DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm/g' ${ROOTFS_DIR}/etc/apache2/mods-available/dir.conf
git clone https://github.com/raspberryenvoie/piRa1n-web.git ${ROOTFS_DIR}/home/pi/piRa1n-web/
cd ${ROOTFS_DIR}/home/pi/piRa1n-web/
cp index.php options.php shutdown.php style.css stylesheet.css update.php update_status.php exit_recovery_mode.php odysseyra1n.php ${ROOTFS_DIR}/var/www/html/
on_chroot << EOF
echo -e "\n# piRa1n-web\nwww-data ALL=(ALL) NOPASSWD: /home/pi/piRa1n/config.sh\nwww-data ALL=(ALL) NOPASSWD: /home/pi/piRa1n/shutdown.sh\nwww-data ALL=(ALL) NOPASSWD: /home/pi/piRa1n-web/update.sh\nwww-data ALL=(ALL) NOPASSWD: /home/pi/piRa1n/exit_recovery_mode.sh\nwww-data ALL=(ALL) NOPASSWD: /home/pi/piRa1n/odysseyra1n.sh\nwww-data ALL=(ALL) NOPASSWD: /home/pi/piRa1n-web/odysseyra1n_done.sh\n# End of piRa1n-web" | sudo EDITOR='tee -a' visudo
chown -R pi:pi /home/pi/piRa1n-web/
EOF
chmod -R 755 ${ROOTFS_DIR}/home/pi/piRa1n-web/
# End of the installation of piRa1n-web
