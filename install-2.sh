#!/bin/bash

sudo locale-gen en_US.utf8
sudo update-locale


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

cd ./mysql

./install.sh

cd ../postgres

./install.sh

cd ../proxy

./install.sh

cd ..


\cp ./entorn $HOME/.local/bin/
chmod +x  $HOME/.local/bin/entorn

if [ -d "/tmp/.X11-unix" ]; then
        sudo rm -rf /tmp/.X11-unix/*
        sudo chmod 0777 /tmp/.X11-unix
fi


exit 0
