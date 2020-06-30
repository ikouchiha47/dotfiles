#!/usr/bin/env sh

# Terminate already running bar instances
function kill_polybar {
    instances=$(pgrep -u $UID -x polybar)
    [[ ! -z "$instances" ]] && (echo "$instances" | xargs kill -9)
}


kill_polybar()
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main -c ~/.config/polybar/config  &
  done
else
    for m in $(polybar --list-monitors | cut -d":" -f1); do
        MONITOR=$m polybar --reload main -c ~/.config/polybar/config &
    done
fi

# Launch bar1 and bar2
# polybar main -c ~/.config/polybar/config &
