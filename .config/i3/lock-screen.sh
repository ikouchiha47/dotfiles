#!/bin/bash

steps=50
min_brightness=2
lock_img="/tmp/i3lock.png"
src_img="/home/rebecca/Pictures/wallpapers/0089.jpg"

set_brightness() {
    xbacklight -set $1
}

get_brightness() {
    result=$(xbacklight -get | awk '{ if($0 < -1) printf("0"); else printf("%.f\n", $0+0.5)}')
    echo $result
}

dim_brightness() {
    xbacklight -set $steps -set $1
}

get_lock_image() {
    [[ ! -f "$lock_img" ]] && convert "$src_img" -scale 2.5% -blur 1x1 -resize 4000% "$lock_img"
    echo $lock_img
}

trap 'exit 0' TERM INT 
trap "set_brightness $(get_brightness)" EXIT

dim_brightness $min_brightness

i3lock -ti "$(get_lock_image)" -n; exit 0

