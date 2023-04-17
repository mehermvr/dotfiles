# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# ZSH_CUSTOM=/usr/share/zsh
ZSH_THEME="agnoster"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages zsh-autosuggestions zsh-syntax-highlighting z sudo history copybuffer copypath copyfile)

source $ZSH/oh-my-zsh.sh

# User configuration
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

alias gs="git status"

export EDITOR="vim"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"
export LOG_DIR="/export/data/meher/logs"
export DATA_DIR="/export/data/meher/data"
# eval $(keychain --eval --quiet id_ed25519)
