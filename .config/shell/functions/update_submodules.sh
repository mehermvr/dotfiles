#!/bin/bash
function update_submodules() {
  git submodule foreach "git fetch --all && git checkout $1 && git pull"
}
