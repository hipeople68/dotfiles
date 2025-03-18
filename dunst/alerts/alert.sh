#!/bin/bash
echo $DUNST_SUMMARY > ~/tmp.txt
if [ "$DUNST_SUMMARY" != "Playing" ] && [ "$DUNST_SUMMARY" != "Paused" ] && [ "$DUNST_APP_NAME" != "Spotify" ]; then
	aplay /home/emma/.dotfiles/dunst/alerts/assets/alert.wav
fi
