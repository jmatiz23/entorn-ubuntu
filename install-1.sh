#!/bin/bash

cd ./installers

if [ ! -e "resources" ]; then
	ln -s ../resources ./resources
fi

if [ ! -e "scripts" ]; then
	ln -s ../scripts ./scripts
fi

if [ ! -e "jetty" ]; then
        ln -s ../jetty-server ./jetty
fi

\cp ./resources/config/.bashrc $HOME/
\cp ./resources/config/.profile $HOME/


mkdir -p $HOME/webapps $HOME/workspaces

### Setting passwd for NB_USER and root
sudo sh -c "echo \"${USER}:pluralcamp\" | chpasswd "
sudo sh -c "echo \"root:pluralcamp\" | chpasswd "

./install-basics-1.sh

./install-basics-2.sh

./install-ssh.sh

./install-docker.sh

./install-firefox.sh

./install-github-cli.sh

./install-java-scala.sh

./install-miniconda3.sh

cd ..

wsl_config_file="/etc/wsl.conf"

sudo rm -f $wsl_config_file
sudo touch $wsl_config_file

echo '[general]' | sudo tee -a $wsl_config_file  > /dev/null  
echo 'guiApplications=false' | sudo tee -a $wsl_config_file  > /dev/null
echo '[boot]' | sudo tee -a $wsl_config_file  > /dev/null
echo '[systemd=true]' | sudo tee -a $wsl_config_file  > /dev/null


/opt/miniconda3/bin/conda init bash
echo "Logout and log in again, now."

exit 0
