#!/bin/bash

dockerdir="$HOME/.docker/proxy"
bindir="$HOME/.local/bin"

mkdir -p $dockerdir

\cp ./docker-compose.yml $dockerdir/
\cp -r ./nginx $dockerdir/
\cp ./bin/proxy-start $bindir/
\cp ./bin/proxy-restart $bindir/
\cp ./bin/proxy-status $bindir/
\cp ./bin/proxy-stop $bindir/
\cp ./bin/proxy $bindir/
chmod +x $bindir/proxy*
echo "Successfully installed"
proxy
exit 0
