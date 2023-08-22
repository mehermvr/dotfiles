#!/bin/zsh
function aliased_ssh()
{
  kitty +kitten themes --reload-in=parent Tokyo Night Moon;
  ssh $@;
  kitty +kitten themes --reload-in=parent Gruvbox Dark
}
compdef aliased_ssh=ssh
