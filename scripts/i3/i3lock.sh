#!/bin/bash

x=$(which i3lock-fancy)
if [[ -z "$x" ]]; then
    x=$(which i3lock)
fi

if [[ -z "$x" ]]; then
    echo "install i3lock or i3lock-fancy"
fi

$x -p
