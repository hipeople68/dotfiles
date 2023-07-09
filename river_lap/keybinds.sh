mod="Mod4"

# close focused view
riverctl map normal $mod+Shift C close

# exit river
riverctl map normal $mod+Shift E exit

# Navigate stack
riverctl map normal $mod J focus-view next
riverctl map normal $mod K focus-view previous

# Swap views in stack
riverctl map normal $mod+Shift J swap next
riverctl map normal $mod+Shift K swap previous

# Focus other outputs
riverctl map normal $mod H focus-output previous
riverctl map normal $mod L focus-output next

# Move views to other outputs
riverctl map normal $mod+Shift H send-to-output previous
riverctl map normal $mod+Shift L send-to-output next

# Move focused view to the top of the layout stack
riverctl map normal $mod+Shift+Return zoom

# Toggle floating
riverctl map normal $mod+Shift Space toggle-float

# Toggle fullscreen
riverctl map normal $mod F toggle-fullscreen

for i in $(seq 1 9)
do
	tags=$((1 << ($i - 1)))

	#focus tags [0-8]
	riverctl map normal $mod $i set-focused-tags $tags

	#tag focused view [0-8]
	riverctl map normal $mod+Shift $i set-view-tags $tags

	#toggle focus of a tag [0-8]
	riverctl map normal $mod+Control $i toggle-focused-tags $tags
	
	#toggle tag of focused view [0-8]
	riverctl map normal $mod+Shift+Control $i toggle-view-tags $tags
done

#launch terminal
riverctl map normal $mod Return spawn kitty

#run menu
riverctl map normal $mod r spawn "wofi --show drun"

#web browser
riverctl map normal $mod w spawn firefox

#wallpaper script
riverctl map normal $mod f2 spawn "/home/emma/.dotfiles/lapwall.sh"

riverctl declare-mode resize
