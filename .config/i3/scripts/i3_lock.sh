#!/bin/sh -e

notify-send "Locking the screen. Patience bitte."

## use the following three commands when you want to reset the lockscreen
# use the following to take a screenshot and then store it somewhere to speed up the locking for next time
# maim /tmp/screen_locked.png
# # blur it
# convert /tmp/screen_locked.png -blur 1x1 /tmp/screen_locked2.png
# # and then lock screen displaying the temp image
# i3lock -e -f -i /tmp/screen_locked2.png

# Lock screen using a fixed background image.
i3lock -e -f -i $HOME/.config/i3/scripts/i3_lock_background_blurred.png
