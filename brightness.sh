#!/bin/bash

# Made to be used by i3wm config for defining hotkeys for:
# increasing or decreasing screen brightness using 'brightnessctl'

# params
jump=7000

current_brightness=$(brightnessctl g)

# increase (smooth)
if [ $1 == "up" ]; then
    let goal=$current_brightness+$jump

    for ((i = $current_brightness ; i <= $goal ; i += 100)); do 
        brightnessctl s "$i"
    done

    brightnessctl s "$goal"
    exit 0
fi

# decrease (smooth)
if [ $1 == "down" ]; then
    let goal=$current_brightness-$jump

    for ((i = $current_brightness ; i >= $goal ; i -= 100)); do 
        brightnessctl s "$i"
    done

    brightnessctl s "$goal"
    exit 0
fi

# Args not valid
exit 1
