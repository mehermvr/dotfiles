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
plugins=(git colored-man-pages zsh-autosuggestions zsh-syntax-highlighting z sudo history copybuffer copypath copyfile conda-zsh-completion zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

if [ -f $HOME/.config/shell/aliases.sh ]; then
    . $HOME/.config/shell/aliases.sh
fi

if [ -f $HOME/.config/shell/zsh_functions.sh ]; then
    . $HOME/.config/shell/zsh_functions.sh
fi

if [ -f $HOME/.config/shell/.condarc ]; then
    . $HOME/.config/shell/.condarc
fi

if [ -f $HOME/.config/shell/.cudarc ]; then
    . $HOME/.config/shell/.cudarc
fi

if [ -f $HOME/.config/shell/ros.rc ]; then
    . $HOME/.config/shell/ros.rc
fi


# theme the tty to rose pine moon
# #!/bin/sh
if [ -f $HOME/.local/bin/setcolors -a "$TERM" = "linux" ]; then
  setcolors $HOME/.config/linux-vt-setcolors/example-colors/terminal.sexy/xcolors.net/mikado
fi

# Autoselect Vi mode indicator
# PROMPT_VI_MODE_BOX='%B%S%F{green}[I]'
# function zvm_after_select_vi_mode() {
#   case $ZVM_MODE in
#     $ZVM_MODE_NORMAL)
#         PROMPT_VI_MODE_BOX='%B%S%F{red}[N]'
#     ;;
#     $ZVM_MODE_INSERT)
#         PROMPT_VI_MODE_BOX='%B%S%F{green}[I]'
#     ;;
#     $ZVM_MODE_VISUAL)
#         PROMPT_VI_MODE_BOX='%B%S%F{yellow}[V]'
#     ;;
#     $ZVM_MODE_VISUAL_LINE)
#         PROMPT_VI_MODE_BOX='%B%S%F{yellow}[V]'
#     ;;
#     $ZVM_MODE_REPLACE)
#         PROMPT_VI_MODE_BOX='%B%S%F{blue}[R]'
#     ;;
#   esac
# }

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias set_us="setxkbmap -layout us"
alias set_de="setxkbmap -layout de"
