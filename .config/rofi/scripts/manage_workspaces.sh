#!/bin/bash

function empty_workspace()
{
	MAX_WORKSPACES=20
	WORKSPACES=$(seq -s '\n' 1 1 ${MAX_WORKSPACES})
	EMPTY_WORKSPACE=$( (i3-msg -t get_workspaces | tr ',' '\n' | grep num | awk -F:  '{print int($2)}' ; echo -e ${WORKSPACES} ) | sort -n | uniq -u | awk '$1 > 0' | head -n 1)

	i3-msg workspace ${EMPTY_WORKSPACE}
}

function gen_workspaces()
{
    i3-msg -t get_workspaces | tr ',' '\n' | grep "name" | sed 's/"name":"\(.*\)"/\1/g' | sort -n
}

function get_next_workspace_number()
{
    local max_number=$(gen_workspaces | awk -F': ' '{print $1}' | sort -n | tail -1)
    if [[ -z "$max_number" ]]; then
        echo "1"
    else
        echo "$((max_number + 1))"
    fi
}

function get_unique_workspace_name()
{
    local name="$1"
    local next_number=$(get_next_workspace_number)
    local unique_name="${next_number}: ${name}"

    local i=1
    while [[ -n "$(i3-msg -t get_workspaces | jq -r 'map(.name)[]' | grep -x "$unique_name")" ]]; do
        unique_name="${next_number}_${i}: ${name}"
        ((i++))
    done

    echo "$unique_name"
}

function rename_current_workspace()
{
    local current_workspace=$(i3-msg -t get_workspaces | jq -r 'map(select(.focused))[0].name')
    local current_number=$(echo "$current_workspace" | cut -d':' -f1)
    local new_name=$(rofi -dmenu -p "New name:")

    if [[ -z "$new_name" ]]; then
        exit 0
    fi

    local new_workspace="${current_number}: ${new_name}"
    i3-msg "rename workspace \"$current_workspace\" to \"$new_workspace\""
}

function reorganize_workspaces() {
    local count=1
    
    while IFS= read -r workspace; do
        if [[ $workspace =~ ^[0-9]+: ]]; then
            new_workspace="${workspace#*: }"
            i3-msg "rename workspace \"$workspace\" to \"$count: $new_workspace\""
        else
            i3-msg "rename workspace \"$workspace\" to \"$count\""
        fi
        ((count++))
    done < <(gen_workspaces)
}

function manage_workspaces()
{

	options=("Empty" "New with name" "Rename current" "Reorganize workspaces")
	local selected_workspace
	selected_workspace=$(echo -e "$(printf '%s\n' "${options[@]}"; echo "$(gen_workspaces)")" | rofi -dmenu -p "Select workspace:")

    case "$selected_workspace" in
        "Empty")
			empty_workspace
            ;;
        "New with name")
            local name
            name=$(rofi -dmenu -p "Enter new workspace name:")
            if [[ -n "$name" ]]; then
                local unique_name
                unique_name=$(get_unique_workspace_name "$name")
                i3-msg "workspace \"$unique_name\""
            fi
            ;;
        "Rename current")
            rename_current_workspace
            ;;
		"Reorganize workspaces")
            reorganize_workspaces
            ;;

        *)
            if [[ -n "$selected_workspace" ]]; then
                i3-msg "workspace \"$selected_workspace\""
            fi
            ;;
    esac
}

manage_workspaces
