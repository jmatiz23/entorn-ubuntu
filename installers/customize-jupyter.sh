#!/bin/bash

RESOURCES=/resources
CONDA_BASE_PATH=/opt/miniconda3
KERNELS_DIR=$CONDA_BASE_PATH/share/jupyter/kernels

sudo mkdir -p $RESOURCES
sudo chmod 777 $RESOURCES
cp -r ./resources/* $RESOURCES/

# python
sed -i 's/"Python 3 (ipykernel)"/"Python 3"/g'   $CONDA_BASE_PATH/share/jupyter/kernels/python3/kernel.json

# tslab
if [ -d "$CONDA_BASE_PATH/share/jupyter/kernels/jslab" ]; then
	mv $CONDA_BASE_PATH/share/jupyter/kernels/jslab $CONDA_BASE_PATH/share/jupyter/kernels/javascript
	echo "Moved jslab to javascript"
fi

if [ -d "$CONDA_BASE_PATH/share/jupyter/kernels/tslab" ]; then
	mv $CONDA_BASE_PATH/share/jupyter/kernels/tslab $CONDA_BASE_PATH/share/jupyter/kernels/typescript
	echo "Moved tslab to typescript"
fi

if grep -q "opt" $CONDA_BASE_PATH/share/jupyter/kernels/typescript/kernel.json
then
	sed -i "s|tslab|$CONDA_BASE_PATH/share/npm-packages/bin/tslab|g" $CONDA_BASE_PATH/share/jupyter/kernels/typescript/kernel.json && \
	sed -i "s|tslab|$CONDA_BASE_PATH/share/npm-packages/bin/tslab|g" $CONDA_BASE_PATH/share/jupyter/kernels/javascript/kernel.json 
fi
echo "Modified kernel.json files"

## logos

[ -d "$CONDA_BASE_PATH/share/jupyter/kernels/java" ] && cp $RESOURCES/logos/java/* $CONDA_BASE_PATH/share/jupyter/kernels/java/

[ -d "$CONDA_BASE_PATH/share/jupyter/kernels/javascript" ] && cp $RESOURCES/logos/js/* $CONDA_BASE_PATH/share/jupyter/kernels/javascript/

[ -d "$CONDA_BASE_PATH/share/jupyter/kernels/typescript" ] && cp $RESOURCES/logos/ts/* $CONDA_BASE_PATH/share/jupyter/kernels/typescript/

[ -d "$CONDA_BASE_PATH/share/jupyter/kernels/imongo" ] && cp $RESOURCES/logos/imongo/* $CONDA_BASE_PATH/share/jupyter/kernels/imongo/

if [ ! -e "/opt/conda" ]; then
	sudo ln -s /opt/miniconda3 /opt/conda
fi

## Server customization
sudo mkdir -p /etc/jupyter
sudo cp ./resources/config/jupyter_server_config.py /etc/jupyter/

jupyter_run_alias=jupyterlab
if grep -q "$jupyter_run_alias" $HOME/.bashrc
then
	echo "alias $jupyter_run_alias already set"
else
	echo "alias jupyterlab='jupyter lab'" >> $HOME/.bashrc
fi

#######
RESOURCES_PATH=./resources
NB_USER=$USER
NB_GID=$USER

JUPYTERLAB_SETTINGS_DIR=/home/$NB_USER/.jupyter/lab/user-settings/@jupyterlab
TERMINAL_DIR=$JUPYTERLAB_SETTINGS_DIR/terminal-extension
DESK_TERM_USER_CONF_DIR=/home/$NB_USER/.config/dconf

mkdir -p $TERMINAL_DIR
chown $NB_USER:$NB_GID -R /home/$NB_USER/.jupyter
\cp $RESOURCES_PATH/config/plugin.jupyterlab-settings $TERMINAL_DIR/

mkdir -p $DESK_TERM_USER_CONF_DIR
chown $NB_USER:$NB_GID -R /home/$NB_USER/.config
\cp $RESOURCES_PATH/config/user $DESK_TERM_USER_CONF_DIR/

echo "Jupyter customization finished."
exit 0

