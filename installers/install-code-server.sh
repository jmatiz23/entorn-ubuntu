#!/bin/bash
DEBIAN_FRONTEND=noninteractive

# Stops script execution if a command has an error
set -e

RESOURCES_PATH=/resources
NB_USER=$USER
NB_GID=1000

if [ ! -f "/usr/local/bin/code-server"  ]; then
    echo "Installing VS Code Server. Please wait..."
    cd ${RESOURCES_PATH}
    curl -fsSL https://code-server.dev/install.sh | sh
    mkdir -p /home/$NB_USER/workspaces && chown $NB_USER:$NB_GID -R /home/$NB_USER/workspaces
    mkdir -p /home/$NB_USER/.config/Code/ && chown $NB_USER:$NB_GID -R /home/$NB_USER/.config
    mkdir -p /home/$NB_USER/.vscode/extensions/ && chown $NB_USER:$NB_GID -R /home/$NB_USER/.vscode
    if [[ ! -e /usr/bin/code-server ]]; then 
        ln -s /opt/miniconda3/share/npm-packages/bin/code-server /usr/bin/code-server
    fi 
else
    echo "VS Code Server is already installed"
fi

