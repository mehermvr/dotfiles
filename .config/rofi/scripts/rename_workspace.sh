#!/bin/bash

CURRENT_WORKSPACE=$(i3-msg -t get_workspaces | jq -r 'map(select(.focused))[0].name')
NEW_NAME=$(echo -e "Rename Workspace\nCancel" | rofi -dmenu -p "New name:")

if [[ "${NEW_NAME}" == "Cancel" ]]; then
    exit 0
fi

i3-msg "rename workspace \"${CURRENT_WORKSPACE}\" to \"${NEW_NAME}\""
