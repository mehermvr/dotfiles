#!/bin/bash
# the entry install script
install_package() 
{
        sudo apt install --no-install-recommends -y "$@"
}

install_package git neovim zsh bat kitty build-essential ripgrep curl zsh

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
yadm clone -f --bootstrap https://github.com/mehermvr/dotfiles.git
yadm bootstrap
