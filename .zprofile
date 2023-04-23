# ssh
# can run ssh-agen but that asks for an x11 password prompt
# alternative is keychain
eval $(keychain --nogui --eval --quiet id_ed25519 )

source $HOME/.config/shell/ask.sh

ask "Start Hyprland?" Y && Hyprland
