#!/bin/bash

dir=postgres

bindir=~/.local/bin
dockerdir=~/.docker

mkdir -p $bindir
mkdir -p $dockerdir/$dir

cp -r ./* $dockerdir/$dir/
mv $dockerdir/$dir/bin/* $bindir/
chmod +x $bindir/*
rmdir $dockerdir/$dir/bin
rm -f $bindir/$0

sudo apt update && sudo apt install --no-install-recommends -y postgresql-client && \
    curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add && \
    sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/focal pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list' && \
    sudo apt update && sudo apt upgrade -y --allow-downgrades


######
## Jupyter Server Proxy config:
CONFIG_NB_FILE=/etc/jupyter/jupyter_server_config.py
cat ./proxy-server.entorn-io.py >> $CONFIG_NB_FILE


## for docker login
\cp ./config.json $dockerdir/
chmod 600 $dockerdir/config.json

exit 0
