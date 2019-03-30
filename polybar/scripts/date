#!/bin/bash

#()🌣

#DATE=$(date +'%A %d %b %Y')
DATE=$(date +'%a %d %b %Y    %H:%M')

# get current month
MONTH=$(date +'%m')

# between March and May 
if [[ $MONTH -ge 3 && $MONTH -le 5 ]]; then
  IMAGE=""
  COLOR="#708376" 

# between June and August
elif [[ $MONTH -ge 6 && $MONTH -le 8 ]]; then
  IMAGE="🌣"
  COLOR="#708376"

# between September and November 
elif [[ $MONTH -ge 9 && $MONTH -le 11 ]]; then
  IMAGE=""
  COLOR="#708376"

# between December and February
else
  IMAGE=""
  COLOR="#708376"
fi

echo "%{A:gsimplecal &:}%{F$COLOR}$IMAGE%{F-} $DATE%{A}"