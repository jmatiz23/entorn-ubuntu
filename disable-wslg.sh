#!/bin/bash

wsl_config_file="/etc/wsl.conf"

sudo rm -f $wsl_config_file
sudo touch $wsl_config_file

echo "Disabling WSLg ..."

echo '[general]' | sudo tee -a $wsl_config_file  > /dev/null
echo 'guiApplications=false' | sudo tee -a $wsl_config_file  > /dev/null
echo '[boot]' | sudo tee -a $wsl_config_file  > /dev/null
echo '[systemd=true]' | sudo tee -a $wsl_config_file  > /dev/null

echo
echo "Now, restart WSL: run 'wsl --shutdown' in a PowerShell terminal as Administrator, and open again an Ubuntu bash terminal"
echo "----"
echo "After running 'entorn' or 'vnc start' in a Ubuntu terminal, a VNC connection can be open using port 5901"
echo
exit 0
