#!/bin/bash

# Enable exit on error
set -e
# Show all commands
set -x

echo "Installing ssh and related tools..."

sudo apt-get update
sudo apt-get install -y --no-install-recommends \
  openssh-client \
  openssh-server 

  # SSLH for SSH + HTTP(s) Multiplexing
sudo apt-get install -y --no-install-recommends \
  sslh 
  # SSH Tooling
sudo apt-get install -y --no-install-recommends \
  autossh \
  sshfs \
  mussh 

chmod go-w $HOME
mkdir -p $HOME/.ssh/
# create empty config file if not exists
touch $HOME/.ssh/config 
sudo chown -R $NB_USER:users $HOME/.ssh
chmod 700 $HOME/.ssh
printenv >> $HOME/.ssh/environment
sudo chmod -R a+rwx /usr/local/bin/

exit 0
