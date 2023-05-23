#!/bin/bash

MAX_WORKSPACES=20

# create a list of numbers 1 to max
WORKSPACES=$(seq -s '\n' 1 1 ${MAX_WORKSPACES})

# first shell command combines WORKSPACES and current workspace names, then pipes to sort, unique, and head to get the first unique workspace num. uniq -u only prints unique lines.
EMPTY_WORKSPACE=$( (i3-msg -t get_workspaces | tr ',' '\n' | grep num | awk -F:  '{print int($2)}' ; \
            echo -e ${WORKSPACES} ) | sort -n | uniq -u | head -n 1)

i3-msg workspace ${EMPTY_WORKSPACE}
