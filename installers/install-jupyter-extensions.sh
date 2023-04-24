#!/bin/sh

conda install -c conda-forge --yes \
  jupyter_nbextensions_configurator \
  jupyter_contrib_nbextensions \
  jupyter-server-proxy \
  jupyterlab-drawio \
  jupyterlab-git \
  jupyterlab-pullrequests \
  diff-match-patch \
  jupyter-videochat
#  jupyterlab=3.5.3

jupyter labextension install @jupyterlab/server-proxy
exit 0
#jupyter server extension enable --sys-prefix --py jupyter_videochat

pip install nbgitpuller

#pip install jupyter_contrib_nbextensions

jupyter contrib nbextension install --sys-prefix
exit 0

