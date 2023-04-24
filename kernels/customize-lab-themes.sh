#!/bin/bash
PYTHON_MAJOR_VERSION=3.10
#if [[ -z "$RESOURCES_PATH" ]]; then
       RESOURCES_PATH=../resources
#fi

sudo mkdir -p /opt/conda/share/jupyter/lab/themes/@jupyterlab/theme-dark-extension
sudo mkdir -p /opt/conda/share/jupyter/lab/themes/@jupyterlab/theme-light-extension

sudo mkdir -p /opt/conda/lib/python$PYTHON_MAJOR_VERSION/site-packages/jupyterlab/themes/@jupyterlab/theme-light-extension
sudo mkdir -p /opt/conda/lib/python$PYTHON_MAJOR_VERSION/site-packages/jupyterlab/themes/@jupyterlab/theme-dark-extension
sudo chown $USER:$USER /opt/conda/share/jupyter -R

sudo chown  $USER:$USER /opt/conda/lib/python$PYTHON_MAJOR_VERSION -R

DIR=$RESOURCES_PATH/config/jupyterlab-custom

if [[ -d "$DIR" ]]
then

  cp $DIR/light/index.css  /opt/conda/share/jupyter/lab/themes/@jupyterlab/theme-light-extension/

  cp $DIR/dark/index.css  /opt/conda/share/jupyter/lab/themes/@jupyterlab/theme-dark-extension/

  cp $DIR/light/index.css /opt/conda/lib/python$PYTHON_MAJOR_VERSION/site-packages/jupyterlab/themes/@jupyterlab/theme-light-extension/index.css

  cp $DIR/dark/index.css /opt/conda/lib/python$PYTHON_MAJOR_VERSION/site-packages/jupyterlab/themes/@jupyterlab/theme-dark-extension/index.css

fi

