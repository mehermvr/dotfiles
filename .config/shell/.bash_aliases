function mv_paper() {
  source_file="$1"
  destination_dir="$HOME/work/papers/downloads"
  
  if [ -z "$2" ]; then
    # Use the same name if the second argument is not supplied
    destination_file="$destination_dir/$(basename "$source_file")"
  else
    destination_file="$destination_dir/$2"
  fi
  
  mv "$source_file" "$destination_file"
  echo "File moved to: $destination_file"
}

function aliased_ssh()
{
  kitty +kitten themes --reload-in=parent Tokyo Night Moon;
  ssh $@;
  kitty +kitten themes --reload-in=parent Gruvbox Dark
}
compdef aliased_ssh=ssh

function update_submodules() {git submodule foreach "git fetch --all && git checkout $1 && git pull"}

# For a full list of active aliases, run `alias`.
alias ocp="cp"
alias cp="rsync -azrvuh --progress"
alias gs="git status"
alias gf="git fetch"
alias gfs="git fetch && git status"
alias gp="git pull --rebase"
alias gcp="git commit && git push"
alias tb_here="tensorboard --logdir ."
alias optdash_here="optuna-dashboard sqlite:///db.sqlite3"
# useful when the remote doesn't have kitty terminfo files, if you see some error about terminal unknown crap
alias ssh_kitty='kitty +kitten ssh'


alias c="clear"
alias reload_theme="kitty +kitten themes --reload-in=parent Gruvbox Dark"

#### alias if exists

if command -v nvim &> /dev/null
then
        alias vim="nvim"
else
        echo "nvim could not be found, not aliasing it to vim"
fi

if command -v btop &> /dev/null
then
        alias htop="btop"
else
        echo "btop could not be found, not aliasing it to htop"
fi

if command -v bat &> /dev/null
then
        alias cat="bat"
else
        if command -v batcat &> /dev/null
        then
                alias cat="batcat"
        else
                echo "bat could not be found, not aliasing it to cat"
 
        fi
fi

