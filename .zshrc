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

if [ -f ~/.env ]; then
    . ~/.env
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.config/shell/.cudarc ]; then
    . ~/.config/shell/.cudarc
fi

# theme the tty to rose pine moon
# #!/bin/sh
if [ -f $HOME/.local/bin/setcolors -a "$TERM" = "linux" ]; then
  setcolors $HOME/.config/linux-vt-setcolors/example-colors/terminal.sexy/xcolors.net/mikado
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
