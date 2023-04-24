#!/bin/bash

# Enable exit on error
set -e
# Show all commands
set -x

echo ""
echo "Installing Firefox browser ..."
echo ""

#  install firefox browser (ubuntu 22.04)
sudo add-apt-repository ppa:mozillateam/ppa

echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox

sudo apt update

sudo apt install firefox -y --allow-downgrades

sudo apt autoremove -y

exit 0
