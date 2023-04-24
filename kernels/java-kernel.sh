#!/bin/bash

# Disable exit on error
set +e
# Show all commands
set -x

RESOURCES_PATH=/resources
IJAVA_VERSION=1.3.0

## Copy resources
sudo mkdir -p $RESOURCES_PATH
sudo chown $USER:1000 -R $RESOURCES_PATH
cp -r ../resources/* $RESOURCES_PATH/


echo "Installing java kernel ..."
echo ""

cd /tmp
wget -O ijava-${IJAVA_VERSION}.zip https://github.com/SpencerPark/IJava/releases/download/v${IJAVA_VERSION}/ijava-${IJAVA_VERSION}.zip 
unzip -o ./ijava-${IJAVA_VERSION}.zip
python3 install.py --sys-prefix --startup-scripts-path /opt/jshell/printing.jshell
rm -f /tmp/ijava-${IJAVA_VERSION}.zip && rm -f /tmp/install.py && rm -rf /tmp/ijava

# Customizing java kernel
cp $RESOURCES_PATH/config/ijava/kernel.json /opt/miniconda3/share/jupyter/kernels/java/kernel.json

# Adding startup-script for java kernel
sudo mkdir -p /opt/jshell
sudo chown $USER:1000 /opt/jshell
cp $RESOURCES_PATH/config/ijava/printing.jshell /opt/jshell/

exit 0	
