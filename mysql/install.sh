#!/bin/bash

dir=mysql

bindir=~/.local/bin
dockerdir=~/.docker

mkdir -p $bindir
mkdir -p $dockerdir/$dir

cp -r ./* $dockerdir/$dir/
mv $dockerdir/$dir/bin/* $bindir/
chmod +x $bindir/*
rmdir $dockerdir/$dir/bin
rm -f $bindir/$0

## Installing mysql cli client
sudo apt update
sudo apt install mysql-client-core-8.0 libgbm1 libwayland-server0  -y

\cp ./config.json $dockerdir/
chmod 600 $dockerdir/config.json

conf_file="${HOME}/.my.cnf"
echo "[client]" > $conf_file
echo "socket=/var/run/mysqld/mysqld.sock" >> $conf_file
echo
echo "To start MySQL server, run: my start"
echo
echo "Client Connection command:"
echo "mysql -u$(whoami) -ppluralcamp"
echo
exit 0

