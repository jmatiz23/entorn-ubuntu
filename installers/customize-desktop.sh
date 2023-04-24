#!/bin/bash

RESOURCES_PATH=./resources
NB_USER=$USER

# Desktop appearance config
xfce4_config_user_dir=/home/$NB_USER/.config/xfce4
mkdir -p $xfce4_config_user_dir
if [ ! -f "$xfce4_config_user_dir/lock" ]; then
        \cp -r $RESOURCES_PATH/config/xfce4/* $xfce4_config_user_dir/
        chown $NB_USER:$NB_USER -R $xfce4_config_user_dir/
fi

