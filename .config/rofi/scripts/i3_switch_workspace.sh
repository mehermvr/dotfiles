#!/bin/bash

function empty_workspace()
{
	MAX_DESKTOPS=20
	WORKSPACES=$(seq -s '\n' 1 1 ${MAX_DESKTOPS})
	EMPTY_WORKSPACE=$( (i3-msg -t get_workspaces | tr ',' '\n' | grep num | awk -F:  '{print int($2)}' ; \
				echo -e ${WORKSPACES} ) | sort -n | uniq -u | head -n 1)

	i3-msg workspace ${EMPTY_WORKSPACE}
}

function gen_workspaces()
{
    i3-msg -t get_workspaces | tr ',' '\n' | grep "name" | sed 's/"name":"\(.*\)"/\1/g' | sort -n
}


WORKSPACE=$( (echo empty; gen_workspaces)  | rofi -dmenu -p "Select workspace:")

if [ x"empty" = x"${WORKSPACE}" ]
then
	empty_workspace
elif [ -n "${WORKSPACE}" ]
then
    i3-msg workspace "${WORKSPACE}"
fi
