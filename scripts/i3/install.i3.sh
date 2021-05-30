#!/bin/sh

sudo pacman -S i3-wm gsimplecal
yay -S i3lock-fancy

echo "copy i3 stuff"
echo "cp .config/i3/* ~/.config/i3/"
