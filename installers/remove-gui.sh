#!/bin/bash
DEBIAN_FRONTEND=noninteractive
# Enable exit on error
set -e
# Show all commands
set -x

echo ""
echo "Installing GUI ..."
echo ""
RESOURCES_PATH=/resources

# Install xfce4 & gui tools

# Use staging channel to get newest xfce4 version (4.16)
sudo add-apt-repository -y ppa:xubuntu-dev/staging
sudo apt-get update
sudo apt-get remove -y xorg gconf2

# Install dependencies to enable vncserver
sudo apt-get remove -y xauth xinit dbus-x11 
# Install gdebi deb removeer
sudo apt-get remove -y gdebi

# Search for files
sudo apt-get remove -y catfish
sudo apt-get remove -y font-manager
# vs support for thunar
sudo apt-get remove -y thunar-vcs-plugin


# Disk Usage Visualizer
sudo apt-get remove -y baobab 
# Lightweight text editor
sudo apt-get remove -y mousepad 
#sudo apt-get remove -y vim
# Process monitoring
sudo apt-get remove -y htop 
# Install Archive/Compression Tools: https://wiki.ubuntuusers.de/Archivmanager/
sudo apt-get remove -y p7zip p7zip-rar 
sudo apt-get remove -y thunar-archive-plugin 
sudo apt-get remove -y xarchiver 

# DB Utils
sudo apt-get remove -y sqlitebrowser
# Install nautilus and support for sftp mounting
sudo apt-get remove -y nautilus gvfs-backends
# Install gigolo - Access remote systems
sudo apt-get remove -y gigolo gvfs-common 
# xfce systemload panel plugin - needs to be activated
# sudo apt-get remove -y --no-remove-recommends xfce4-systemload-plugin && \
# Leightweight ftp client that supports sftp, http, ...
sudo apt-get remove -y gftp 
# Remove light-locker to prevent screen lock
sudo apt-get remove -y -q light-locker 
sudo apt-get update
sudo apt install -y libgbm1 sudo apt-transport-https curl

# Cleanup
sudo apt-get purge -y pm-utils xscreensaver* 
# Large package: gnome-user-guide 50MB app-remove-data 50MB
sudo apt-get remove -y app-install-data gnome-user-guide


sudo apt remove gnome-session gdm3 --yes
sudo apt remove ubuntu-gnome-desktop --yes

#sudo apt remove tasksel --yes
#sudo tasksel remove ubuntu-desktop 
#sudo tasksel


sudo mkdir -p /etc/gdm3

sudo sh -c 'echo "AutomaticLoginEnable=true" >> /etc/gdm3/custom.conf'
sudo sh -c "AutomaticLogin=$USER >>/etc/gdm3/custom.conf"

echo #########################################
echo "https://github.com/microsoft/wslg#wslg-system-distro"
echo "https://gist.github.com/tdcosta100/385636cbae39fc8cd0937139e87b1c74#running-systemd-genie"
echo "Run remove-turbovnc.sh"

#./customize-desktop.sh

exit 0

