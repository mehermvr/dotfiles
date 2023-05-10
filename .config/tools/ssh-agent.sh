#!/bin/sh
systemctl --user enable ssh-agent.service
systemctl --user start ssh-agent.service
echo "AddKeysToAgent yes" >> .ssh/config
