#!/bin/sh
swww init
swww img $(find /home/emma/Pictures/Wallpapers -type f | shuf -n 1)
