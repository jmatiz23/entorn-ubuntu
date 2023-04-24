#!/bin/bash

# Stops script execution if a command has an error
set -e

echo "Installing turbovnc ..."
echo ""

TURBOVNC_VERSION="3.0"

#wget -q "https://sourceforge.net/projects/turbovnc/files/${TURBOVNC_VERSION}/turbovnc_${TURBOVNC_VERSION}_amd64.deb/download" -O turbovnc_${TURBOVNC_VERSION}_amd64.deb 

#sudo apt-get install -y -q ./turbovnc_${TURBOVNC_VERSION}_amd64.deb 

#sudo apt-get remove -y -q light-locker

#rm ./turbovnc_${TURBOVNC_VERSION}_amd64.deb

#if [ ! -e "/usr/local/bin/vncserver" ]; then
#	sudo ln -s /opt/TurboVNC/bin/* /usr/local/bin/ 
#fi

#sudo apt update && sudo apt install -y at-spi

#cp scripts/vnc* $HOME/.local/bin/
#chmod +x $HOME/.local/bin/vnc*

sudo apt install tigervnc-standalone-server --yes


vnc_config_user_dir=/home/$USER/.vnc
mkdir -p $vnc_config_user_dir
if [ ! -f "$vnc_config_user_dir/passwd" ]; then
	\cp -r resources/config/vnc/* $vnc_config_user_dir/
fi
chown $USER:$USER -R $vnc_config_user_dir/
chmod 600 $vnc_config_user_dir/passwd

sudo sh -c 'echo "[boot]" > /etc/wsl.conf'
sudo sh -c 'echo "systemd=true" >> /etc/wsl.conf'
sudo mv /usr/bin/Xorg /usr/bin/Xorg_old
sudo cp resources/config/Xorg_new /usr/bin/Xorg_new
sudo chmod 0755 /usr/bin/Xorg_new
sudo ln -sf Xorg_new /usr/bin/Xorg

echo ##################################
echo "Shutdown WSL and restart it now."
echo ##################################


exit 0

