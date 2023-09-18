#!/bin/bash

script_dir="$(dirname "$0")/functions"
source "$script_dir/dist_install.sh" # gets me install_package

install_package git curl

# some initial setup
LOCAL_SRC=$HOME/source
LOCAL_BIN=$HOME/.local/bin
PATH=$LOCAL_BIN:$PATH
mkdir -p "$LOCAL_SRC"
mkdir -p "$LOCAL_BIN"

# setup yadm
git clone https://github.com/TheLocehiliosan/yadm.git "$LOCAL_SRC"/yadm
ln -s "$LOCAL_SRC"/yadm/yadm "$LOCAL_BIN"/yadm

yadm clone -f --bootstrap https://github.com/mehermvr/dotfiles.git
yadm bootstrap
