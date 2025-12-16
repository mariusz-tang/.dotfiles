#!/usr/bin/zsh

focused_window=$(xdotool getwindowfocus -f)
output=$(xdotool getwindowgeometry --shell $focused_window)
width=$(echo $output | awk '/WIDTH/ { print }' | cut -d "=" -f 2)
height=$(echo $output | awk '/HEIGHT/ { print }' | cut -d "=" -f 2)
move_y=$((height / 2))
move_x=$((width / 2))
xdotool mousemove --window $focused_window $move_x $move_y
