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

if command -v nvim &> /dev/null
then
        alias vim="nvim"
else
        echo "nvim could not be found, not aliasing it to vim"
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

function aliased_ssh()
{
  kitty +kitten themes --reload-in=parent Tokyo Night Moon;
  ssh $@;
  kitty +kitten themes --reload-in=parent Gruvbox Dark
}

function update_submodules() {git submodule foreach "git fetch --all && git checkout $1 && git pull"}

# compdef aliased_ssh=ssh
# alias ssh="aliased_ssh"
alias c="clear"
alias htop="btop"
