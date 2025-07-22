#!/bin/sh
while true; do
	swww img -o eDP-2 $(find /home/emma/Pictures/Wallpapers -type f | shuf -n 1)
	sleep 1h
done
