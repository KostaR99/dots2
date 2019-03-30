#!/usr/bin/bash

CAPS_STATUS=$(xset -q | grep Caps | awk '{ print $4 }')

#CAPS off
if [[ ${CAPS_STATUS} = "off" ]]; then
    COLOR="#708376"
    CAPS_SHOW=" caps "

# CAPS on
else
    COLOR="#b3b9ad"
    CAPS_SHOW="CAPS"
fi

echo '%{F'$COLOR'}'$CAPS_SHOW'%{F-}'