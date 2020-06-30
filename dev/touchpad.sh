#!/bin/bash

echo "copying touchpad config"

cat dev/40-libinput.conf

read -r -p "Confirm to copy to xorg.conf.d [y/N] " response
response=${response,,} # lowercase

if [[ "$response" == "n" ]]; then
	exit 0
fi

sudo cp 40-libinput.conf /usr/share/X11/xorg.conf.d/
