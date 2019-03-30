#!/bin/bash

#cmus
#ARTIST=$(cmus-remote -Q | grep ' artist ' | cut -d ' ' -f3-)
#TITLE=$(cmus-remote -Q | grep title | cut -d ' ' -f2-)

LAUNCHED=$(qdbus | grep clementine)

if [[ $LAUNCHED != "" ]]; then

	#clementine
	ARTIST=$(qdbus org.mpris.MediaPlayer2.clementine /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get org.mpris.MediaPlayer2.Player Metadata | grep artist | cut -d ' ' -f2-)
	TITLE=$(qdbus org.mpris.MediaPlayer2.clementine /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get org.mpris.MediaPlayer2.Player Metadata | grep title  | cut -d ' ' -f2-)

	if [[ $ARTIST != "" ]]; then
	  OUTPUT=$ARTIST
	fi

	if [[ $TITLE != "" ]]; then
	  OUTPUT="$OUTPUT — $TITLE"
	fi

	# ooops actualy it's possible to replace all qdbus with clementine flags... 
	PLAY_PAUSE="%{A1:exec qdbus org.mpris.MediaPlayer2.clementine /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause:}⏯%{A}"
	PREVIOUS="%{A1:exec qdbus org.mpris.MediaPlayer2.clementine /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous:}%{A}"
	NEXT="%{A1:exec qdbus org.mpris.MediaPlayer2.clementine /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next:}%{A}"
	OUTPUT="$OUTPUT   $PREVIOUS   $PLAY_PAUSE   $NEXT"
#fi
else
	OUTPUT="%{A1:clementine & sleep 3s && clementine -p:}♫%{A}"	
fi
echo "$OUTPUT"
#echo "<span color='#C3BEBD'>"$OUTPUT"</span>"
#echo '%{F'$COLOR'}'$CAPS_SHOW'%{F-}'
