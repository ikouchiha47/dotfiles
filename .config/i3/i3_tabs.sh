#!/bin/bash

id=`python $HOME/.config/i3/i3-tabs.py`
i3-msg [id="$id"] focus > /dev/null
