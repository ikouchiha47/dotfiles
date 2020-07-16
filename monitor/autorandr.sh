#!/bin/bash

USER=""
LOG_FILE="/home/$USER/udev.log"

export XAUTHORITY=/home/$USER/.Xauthority
export DISPLAY=:0

log() {
 echo "$@" | tee -a $LOG_FILE

}

# un comment to see what errors

# xrandr 
#exec >"$LOG_FILE" 2>&1 

primary() {
    local monitor=$(xrandr | grep -w connected | grep -w primary)
    echo "$monitor"
}

connected() {
    local monitors=$(xrandr | grep -w connected | grep -v primary)

    echo "$monitors"
}

disconnected() {
    local monitors=$(xrandr | grep -w disconnected | grep -vi virtual)

    echo "$monitors"
}

cmd="xrandr"

m_con=$(connected)
m_dcon=$(disconnected)
m_pri=$(primary | cut -d' ' -f1)



# enabled dispaly
next_mon="$m_pri"
enabled=""

IFS=$'\n'

while read -r monitor; do
    mon=$(echo "$monitor" |  cut -d' ' -f1)
    
    enabled="$enabled --output $mon --left-of $next_mon"

    next_mon="$mon"
done< <(echo "$m_con")

log "enabled dipalys $enabled" 

# disabled displays

disabled=""

while read -r monitor; do
    mon=$(echo "$monitor" | cut -d' ' -f1)
    disabled="$disabled --output $mon --off"

done< <(echo "$m_dcon")

log "disabled displays $disabled" 

if [[ -z "$m_pri" ]]; then
	log "xrandr failed"
	exit 1
fi

cmd="$cmd $disabled"

if [[ ! -z "$m_con" ]]; then
	cmd="$cmd $enabled --auto"
fi

log "$cmd"

eval $cmd 

