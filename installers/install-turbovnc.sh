#!/bin/bash
DEBIAN_FRONTEND=noninteractive

TURBOVNC_VERSION="3.0"
# Stops script execution if a command has an error
set -e

echo "Installing turbovnc ..."
echo ""

sudo wget -q "https://sourceforge.net/projects/turbovnc/files/${TURBOVNC_VERSION}/turbovnc_${TURBOVNC_VERSION}_amd64.deb/download" -O turbovnc_${TURBOVNC_VERSION}_amd64.deb 

sudo apt-get install -y -q ./turbovnc_${TURBOVNC_VERSION}_amd64.deb 

sudo apt-get remove -y -q light-locker

sudo rm ./turbovnc_${TURBOVNC_VERSION}_amd64.deb

sudo ln -s /opt/TurboVNC/bin/* /usr/local/bin/ || echo "symlinks already exist"

sudo apt update && sudo apt install -y at-spi

mkdir -p $HOME/.local/bin/ $HOME/.vnc/

\cp ./bin/vnc* $HOME/.local/bin/

sudo chmod +x  $HOME/.local/bin/vnc*

\cp ./bin/xstartup $HOME/.vnc/

sudo chmod +x $HOME/.vnc/xstartup

exit 0

