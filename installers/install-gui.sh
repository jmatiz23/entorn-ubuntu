#!/bin/bash

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
sudo apt-get install -y --no-install-recommends xorg gconf2

# Install dependencies to enable vncserver
sudo apt-get install -y --no-install-recommends xauth xinit dbus-x11 
# Install gdebi deb installer
sudo apt-get install -y --no-install-recommends gdebi

# Search for files
sudo apt-get install -y --no-install-recommends catfish
sudo apt-get install -y --no-install-recommends font-manager
# vs support for thunar
sudo apt-get install -y thunar-vcs-plugin


# Disk Usage Visualizer
sudo apt-get install -y --no-install-recommends baobab 
# Lightweight text editor
sudo apt-get install -y --no-install-recommends mousepad 
sudo apt-get install -y --no-install-recommends vim
# Process monitoring
sudo apt-get install -y --no-install-recommends htop 
# Install Archive/Compression Tools: https://wiki.ubuntuusers.de/Archivmanager/
sudo apt-get install -y p7zip p7zip-rar 
sudo apt-get install -y --no-install-recommends thunar-archive-plugin 
sudo apt-get install -y xarchiver 

# DB Utils
sudo apt-get install -y --no-install-recommends sqlitebrowser
# Install nautilus and support for sftp mounting
sudo apt-get install -y --no-install-recommends nautilus gvfs-backends
# Install gigolo - Access remote systems
sudo apt-get install -y --no-install-recommends gigolo gvfs-common 
# xfce systemload panel plugin - needs to be activated
# sudo apt-get install -y --no-install-recommends xfce4-systemload-plugin && \
# Leightweight ftp client that supports sftp, http, ...
sudo apt-get install -y --no-install-recommends gftp 
# Remove light-locker to prevent screen lock
sudo apt-get remove -y -q light-locker 
sudo apt-get update
sudo apt install --no-install-recommends -y libgbm1 sudo apt-transport-https curl

# Cleanup
sudo apt-get purge -y pm-utils xscreensaver* 
# Large package: gnome-user-guide 50MB app-install-data 50MB
sudo apt-get remove -y app-install-data gnome-user-guide

sudo apt install tasksel --yes
sudo tasksel

sudo sh -c 'echo "AutomaticLoginEnable=true" >> /etc/gdm3/custom.conf'
sudo sh -c "AutomaticLogin=$USER >>/etc/gdm3/custom.conf"

echo #########################################
echo "https://github.com/microsoft/wslg#wslg-system-distro"
echo "https://gist.github.com/tdcosta100/385636cbae39fc8cd0937139e87b1c74#running-systemd-genie"
echo "Run install-turbovnc.sh"

./customize-desktop.sh

exit 0

