#!/bin/bash

# Disable exit on error
set +e
# Show all commands
set -x
NB_USER=$USER
CONDA_PREFIX=/opt/miniconda3
CONDA_BASE_PATH=$CONDA_PREFIX
NB_UID=1000
NB_GID=1000
NPM_PAKAGES_SYS_DIR=$CONDA_PREFIX/share/npm-packages


echo "Installing javascript and typescripts kernels ..."
echo ""

npm -version
npm config set prefix $CONDA_BASE_PATH/share/npm-packages 
echo 'NPM_PACKAGES="$CONDA_BASE_PATH/share/npm-packages"' >> /home/$NB_USER/.bashrc

echo 'export PATH="$PATH:$NPM_PACKAGES/bin"' >> /home/$NB_USER/.bashrc


mkdir -p $NPM_PAKAGES_SYS_DIR/bin 
mkdir -p $NPM_PAKAGES_SYS_DIR/lib
chown -R $NB_UID:$NB_GID $NPM_PAKAGES_SYS_DIR 
npm install -g npm@${NPM_VER}
npm install -g js-beautify

echo "prefix=$CONDA_BASE_PATH/share/npm-packages" > /home/$NB_USER/.npmrc 
mkdir -p $CONDA_BASE_PATH/share/npm-packages/lib 
chown -R $NB_UID:$NB_GID $CONDA_BASE_PATH/share/npm-packages

npm install -g tslab
$CONDA_BASE_PATH/share/npm-packages/bin/tslab install 
mv $HOME/.local/share/jupyter/kernels/*slab $CONDA_BASE_PATH/share/jupyter/kernels/

exit 0	
