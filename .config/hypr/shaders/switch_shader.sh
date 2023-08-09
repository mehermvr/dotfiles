#!/bin/bash

# Define the file names
prefix=$(dirname $0)
shader1=$(realpath "$prefix/blue_light.frag")
shader2=$(realpath "$prefix/pass_through.frag")
symlink="$prefix/screen_shader.frag"

# Check if the symlink exists
if [ -L "$symlink" ]; then
    current_target=$(realpath "$symlink")
    echo "current target is $current_target"
    if [ "$current_target" = "$shader1" ]; then
        # Switch to shader2
        ln -sf "$shader2" "$symlink"
        echo "Switched to $shader2"
    elif [ "$current_target" = "$shader2" ]; then
        # Switch back to shader1
        ln -sf "$shader1" "$symlink"
        echo "Switched to $shader1"
    fi
else
    # Create symlink to shader1 if it doesn't exist
    ln -s "$shader1" "$symlink"
    echo "Created symlink to $shader1"
fi

