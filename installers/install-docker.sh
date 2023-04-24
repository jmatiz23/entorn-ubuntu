#!/bin/bash

# Enable exit on error
set -e
# Show all commands
set -x
NB_USER=$USER
# DOCKER_CHANNEL=stable
# DOCKER_VERSION=23.0.4
DOCKER_COMPOSE_VERSION=2.17.3
echo ""
echo "Installing docker clients ..."
echo ""

sudo apt-get update 

sudo apt-get install -y --no-install-recommends \
  apt-transport-https \
  ca-certificates \
  openssh-client \
  curl \
  wget \
  iputils-ping \
  iptables \
  gnupg

# Next is only for clients:
arch="$(uname --m)"
case "$arch" in \
      # amd64
      x86_64) dockerArch='x86_64' ;; \
      # arm32v6
      armhf) dockerArch='armel' ;; \
      # arm32v7
      armv7) dockerArch='armhf' ;; \
      # arm64v8
      aarch64) dockerArch='aarch64' ;; \
      *) echo >&2 "error: unsupported architecture ($arch)"; exit 1 ;;\
esac 
#if ! wget -O docker.tgz "https://download.docker.com/linux/static/${DOCKER_CHANNEL}/${dockerArch}/docker-${DOCKER_VERSION}.tgz"; then 
#   echo >&2 "error: failed to download 'docker-${DOCKER_VERSION}' from '${DOCKER_CHANNEL}' for '${dockerArch}'"
#   exit 1
#fi
#sudo tar --extract --file docker.tgz --strip-components 1 --directory /usr/local/bin/ 
#sudo rm docker.tgz

#dockerd --version
#docker --version 

# Next is docker engine (including clients)
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

echo ""
echo ">>>>>>>>>>>>>>>>>>>> adding docker group <<<<<<<<<<<<<<<<<<<<<<"
echo ""

sudo groupadd docker && sudo usermod -aG docker $NB_USER && sudo mkdir -p /var/lib/docker

echo ""
echo "Installing docker-compose ..."
echo ""

## docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/v${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose 
sudo chmod +x /usr/local/bin/docker-compose 
sudo chmod 755 /var/lib/docker

docker-compose version

mkdir -p $HOME/.local/bin
cp scripts/dockerd-start $HOME/.local/bin

exit 0
