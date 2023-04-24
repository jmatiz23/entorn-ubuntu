#!/bin/sh
DEBIAN_FRONTEND=noninteractive
export CONDA_PREFIX=/opt/miniconda3

sudo mkdir -p /opt
sudo chmod 777 /opt

sudo apt-get update
sudo apt-get upgrade --yes
sudo apt autoremove --yes

cd ~
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh -bufp /opt/miniconda3
rm Miniconda3-latest-Linux-x86_64.sh


/opt/miniconda3/bin/conda update conda --yes
/opt/miniconda3/bin/conda update --all --yes

/opt/miniconda3/bin/conda install jupyter jupyterlab sqlalchemy pip git --yes

/opt/miniconda3/bin/conda install -c conda-forge jupyter_contrib_nbextensions --yes
/opt/miniconda3/bin/conda install -c conda-forge jupyter-server-proxy --yes
/opt/miniconda3/bin/conda update conda --yes
/opt/miniconda3/bin/conda update --all --yes

sudo chown -R $USER:$USER /opt/miniconda3
sudo rm -f /opt/conda
sudo ln -s /opt/miniconda3 /opt/conda
