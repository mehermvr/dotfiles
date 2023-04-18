#!/bin/sh
# the entry install script
install_package() 
{
        sudo apt install --no-install-recommends -y "$1"
}

install_package git
install_package neovim
install_package zsh
install_package bat
install_package kitty
install_package build-essential
install_package ripgrep

# some initial setup
LOCAL_SRC=$HOME/.local/src
LOCAL_BIN=$HOME/.local/bin
PATH=$LOCAL_BIN:$PATH
mkdir -p "$LOCAL_SRC"
mkdir -p "$LOCAL_BIN"

# setup yadm
git clone https://github.com/TheLocehiliosan/yadm.git "$LOCAL_SRC"/yadm
ln -s "$LOCAL_SRC"/yadm/yadm "$LOCAL_BIN"/yadm 

# TODO: switch this to ssh git later
yadm clone -f --no-bootstrap https://github.com/mehermvr/dotfiles.git
# just to make sure our bootstrap logic is always independent
yadm bootstrap
