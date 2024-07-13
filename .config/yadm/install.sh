#!/bin/bash

script_dir="$(dirname "$0")"
source "$script_dir/setup_env.sh"

install_package git curl

# some initial setup
mkdir -p "$LOCAL_SRC"
mkdir -p "$LOCAL_BIN"

# setup yadm
git clone https://github.com/TheLocehiliosan/yadm.git "$LOCAL_SRC"/yadm
ln -s "$LOCAL_SRC"/yadm/yadm "$LOCAL_BIN"/yadm

yadm clone -f --no-bootstrap https://github.com/mehermvr/dotfiles.git
yadm bootstrap
