#!/bin/sh
count=0
mv -b ~/Pictures/Wallpapers/right ~/Pictures/Wallpapers/$RANDOM
mv -b ~/Pictures/Wallpapers/mid ~/Pictures/Wallpapers/$RANDOM
mv -b ~/Pictures/Wallpapers/left ~/Pictures/Wallpapers/$RANDOM
for file in $(find ~/Pictures/Wallpapers -type f | shuf -n 3)
do
	if (( $count == 0 ))
	then
		mv $file ~/Pictures/Wallpapers/right
	else
		if (( $count == 1 ))
		then
			mv $file ~/Pictures/Wallpapers/left
		else
			if (( $count == 2 ))
			then
				mv $file ~/Pictures/Wallpapers/mid
			fi
		fi
	fi
	((count=count+1))
done
oguri &
