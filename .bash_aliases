# For a full list of active aliases, run `alias`.
alias pscp="rsync -azrvuh --progress"
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
