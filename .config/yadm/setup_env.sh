#!/bin/sh

script_dir="$(dirname "$0")"
source "$script_dir/dist_install.sh" # gets me install_package

LOCAL_SRC=$HOME/source
LOCAL_BIN=$HOME/.local/bin
PATH=$LOCAL_BIN:$PATH
