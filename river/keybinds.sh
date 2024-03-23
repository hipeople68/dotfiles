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

#launch terminal
riverctl map normal $mod Return spawn kitty

#run menu
riverctl map normal $mod r spawn "wofi --show drun"

#web browser
riverctl map normal $mod w spawn firefox
riverctl map normal $mod+Shift w spawn "firefox --private-window"

riverctl declare-mode resize
riverctl map normal $mod+Shift r enter-mode resize
riverctl map resize None escape enter-mode normal

#wallpaper script
riverctl map resize $mod w spawn "/home/emma/.dotfiles/changedeskwall.sh"

# $mod+H and $mod+L to decrease/increase the main ratio of rivertile(1)
riverctl map resize $mod H send-layout-cmd rivertile "main-ratio -0.05"
riverctl map resize $mod L send-layout-cmd rivertile "main-ratio +0.05"

# $mod+Shift+H and $mod+Shift+L to increment/decrement the main count of rivertile(1)
riverctl map resize $mod+Control+Shift H send-layout-cmd rivertile "main-count +1"
riverctl map resize $mod+Control+Shift L send-layout-cmd rivertile "main-count -1"

# $mod+Alt+{H,J,K,L} to move views
riverctl map resize $mod+Control H move left 100
riverctl map resize $mod+Control J move down 100
riverctl map resize $mod+Control K move up 100
riverctl map resize $mod+Control L move right 100

# $mod+Alt+Control+{H,J,K,L} to snap views to screen edges
riverctl map resize $mod+Alt+Control H snap left
riverctl map resize $mod+Alt+Control J snap down
riverctl map resize $mod+Alt+Control K snap up
riverctl map resize $mod+Alt+Control L snap right

# $mod+Alt+Shift+{H,J,K,L} to resize views
riverctl map resize $mod+Shift H resize horizontal -100
riverctl map resize $mod+Shift J resize vertical 100
riverctl map resize $mod+Shift K resize vertical -100
riverctl map resize $mod+Shift L resize horizontal 100

# screenshot
riverctl map normal $mod S spawn "grim -o DP-1 $HOME/Pictures/$(date '+%y%m%d_%H-%M-%S').png"
riverctl map normal $mod+Shift S spawn "slurp | grim -g - $HOME/Pictures/$(date '+%y%m%d_%H-%M-%S').png"
riverctl map normal $mod+Control S spawn "grim $HOME/Pictures/$(date '+%y%m%d_%H-%M-%S').png"

# $mod + Left Mouse Button to move views
riverctl map-pointer resize $mod BTN_LEFT move-view

# $mod + Right Mouse Button to resize views
riverctl map-pointer resize $mod BTN_RIGHT resize-view

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

