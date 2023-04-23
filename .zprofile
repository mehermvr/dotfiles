# ssh
# can run ssh-agen but that asks for an x11 password prompt
# alternative is keychain
eval $(keychain --eval --quiet id_ed25519 id_rsa ~/.keys/my_custom_key)

