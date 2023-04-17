if command -v keychain &> /dev/null
then
  eval $(keychain --eval --quiet id_ed25519)
else
	# TODO: setup gpg key stuff 
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line if you want to disable marking untracked files
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git colored-man-pages zsh-autosuggestions zsh-syntax-highlighting z sudo history copybuffer copypath copyfile)

source $ZSH/oh-my-zsh.sh

# User configuration
# Compilation flags
# export ARCHFLAGS="-arch x86_64"
export EDITOR="vim"
PATH="$PATH:$HOME/.cargo/bin"
PATH="$PATH:$HOME/.local/bin"
export LOG_DIR="/export/data/meher/logs"
export DATA_DIR="/export/data/meher/data"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias gs="git status"
alias pscp="rsync -azrvuh --progress"

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
	# TODO: possibly installed as batcat? need to add
	echo "bat could not be found, not aliasing it to cat"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
