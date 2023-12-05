#!/bin/bash

sudo locale-gen en_US.utf8
sudo update-locale

if [ -d "/tmp/.X11-unix" ]; then 
	sudo rm -rf /tmp/.X11-unix/*
	sudo chmod 0777 /tmp/.X11-unix
fi

cd ./installers

./install-node.sh

sleep 2

./install-code-server.sh

sleep 2

./install-eclipse.sh
./install-netbeans.sh

cd jetty
./install.sh
cd ..

./install-gui.sh

./customize-desktop.sh

./install-chrome.sh

./install-turbovnc.sh

cd ..

\cp ./entorn $HOME/.local/bin/
chmod +x  $HOME/.local/bin/entorn

exit 0
