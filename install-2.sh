#!/bin/bash

cd ./installers

./install-node.sh

sleep 2

./install-code-server.sh

sleep 2

./install-eclipse.sh

cd jetty
./install.sh
cd ..

./install-gui.sh

./install-chrome.sh

./install-turbovnc.sh

cd ..

\cp ./entorn $HOME/.local/bin/
chmod +x  $HOME/.local/bin/entorn

exit 0
