#!/bin/bash

# Made to be used by i3wm config for defining hotkeys for:
# increasing or decreasing screen brightness using 'brightnessctl'

# params
jump=5000

current_brightness=$(brightnessctl g)

# increase
if [ $1 == "up" ]; then
        let "new_brightness = $current_brightness + $jump"
        brightnessctl s "$new_brightness"
        exit 0
fi

# decrease
if [ $1 == "down" ]; then
        let "new_brightness = $current_brightness - $jump"
        brightnessctl s "$new_brightness"
        exit 0
fi

# Args not valid
exit 1

