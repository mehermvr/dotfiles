source "$(dirname $0)/functions.sh"
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

# For a full list of active aliases, run `alias`.
alias ocp="cp"
alias cp="rsync -azrvuh --progress"
alias gs="git status"
alias gf="git fetch"
alias gfs="git fetch && git status"
alias gp="git pull --rebase"
alias gcp="git commit && git push"
alias sgcp="cz commit && git push"
alias tb_here="tensorboard --logdir ."
alias optdash_here="optuna-dashboard sqlite:///db.sqlite3"
# useful when the remote doesn't have kitty terminfo files, if you see some error about terminal unknown crap
alias ssh_kitty='kitty +kitten ssh'

alias c="clear"
alias reload_theme="kitty +kitten themes --reload-in=parent Gruvbox Dark"
alias ckb='cmake -Bbuild . && cmake --build build -j$(nproc)'


