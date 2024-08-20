#!/bin/sh -e

# send a notification, fast version
notify-send "Locking the screen. Patience bitte."

# # send a notification
# notify-send "Locking the screen. This might take a few seconds. Patience bitte"
# use the following to take a screenshot and then store it somewhere to speed up the locking
# # Take a screenshot
# maim /tmp/screen_locked.png
# # blur it
# convert /tmp/screen_locked.png -blur 1x1 /tmp/screen_locked2.png

# Lock screen displaying the temp image.
# i3lock -e -f -i /tmp/screen_locked2.png

# Lock screen using a fixed background image.
i3lock -e -f -i $HOME/.config/scripts/i3_lock_background_blurred.png

# Turn the screen off after a delay.
# sleep 60
# pgrep i3lock && xset dpms force off
