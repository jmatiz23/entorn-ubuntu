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

exit 0

