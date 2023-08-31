#!/bin/zsh
# functions to use inside a zshell
# Get the directory of the current script
# script_dir="$(dirname "$0")/functions"
# source "$script_dir/fork.sh"
# source "$script_dir/move_paper.sh"

source "$(dirname "$0")/load_function.sh"
load_function fork
load_function move_paper
