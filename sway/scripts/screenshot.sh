#!/bin/sh

SCREENSHOT=~/Pictures/Screenshots/screenshot-$(date +"%Y-%m-%d-%H-%M-%S").png

if [ "$1" == select ]; then
    grim -g "$(slurp)" $SCREENSHOT
else
    grim $SCREENSHOT
fi

notify-send -i $SCREENSHOT -t 5000 Done!
paplay /usr/share/sounds/freedesktop/stereo/camera-shutter.oga
