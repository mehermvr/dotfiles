# ssh
# can run ssh-agen but that asks for an x11 password prompt
# alternative is keychain
source $HOME/.config/shell/ask.sh

ask "Start Hyprland?" Y && $HOME/.config/hypr/scripts/start.sh
