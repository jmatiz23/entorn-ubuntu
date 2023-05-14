#!/bin/bash
DEBIAN_FRONTEND=noninteractive
# Enable exit on error
set -e
# Show all commands
set -x

SDKMAN_DIR="/opt/apps/sdkman"
JAVA_VERSION=17.0.6
JAVA_PROVIDER=ms
SCALA_VERSION=3.2.2

sudo apt remove default-jdk default-jre openjdk-11-jdk openjdk-11-jdk-headless openjdk-11-jre openjdk-11-jre-headless --yes && sudo apt autoremove --yes

rm -rf $HOME/.sdkman
sudo mkdir -p /opt/apps
sudo chown $USER:$USER /opt/apps -R
cd /opt/apps

echo ""
echo "Installing runtime for java, scala..."
echo "Java version = ${JAVA_VERSION}-${JAVA_PROVIDER}"
echo "Scala version = ${SCALA3_VER}"
echo ""

export SDKMAN_DIR="/opt/apps/sdkman" && curl -s "https://get.sdkman.io" | bash 
source "$SDKMAN_DIR/bin/sdkman-init.sh"
sdk install java ${JAVA_VERSION}-${JAVA_PROVIDER}
chown $NB_USER:$NB_GID -R $SDKMAN_DIR
if [[ ! -z "$SCALA3_VER" ]]; then
   sdk install scala ${SCALA3_VER} ; 
   sdk install sbt ;
fi

sdk install maven
sdk install gradle

exit 0
