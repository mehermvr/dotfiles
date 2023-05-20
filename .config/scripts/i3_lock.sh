#!/bin/sh -e

# Take a screenshot
maim /tmp/screen_locked.png

# Pixellate it 10x
convert /tmp/screen_locked.png -scale 10% -blur 0x0.5 -resize 1000% /tmp/screen_locked2.png
# Lock screen displaying this image.
i3lock -e -f -i /tmp/screen_locked2.png

# Turn the screen off after a delay.
# sleep 60; pgrep i3lock && xset dpms force off
