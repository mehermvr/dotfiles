#!/bin/bash
# function to use inside bash scripts
# Get the directory of the current script
script_dir="$(dirname "$0")/functions"


load_function(){
  source "$script_dir/$1.sh"
}
