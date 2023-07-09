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
riverctl map normal $mod+Shift r enter-mode resize
riverctl map resize None escape enter-mode normal

# Super+H and Super+L to decrease/increase the main ratio of rivertile(1)
riverctl map resize Super H send-layout-cmd rivertile "main-ratio -0.05"
riverctl map resize Super L send-layout-cmd rivertile "main-ratio +0.05"

# Super+Shift+H and Super+Shift+L to increment/decrement the main count of rivertile(1)
riverctl map resize Super+Shift H send-layout-cmd rivertile "main-count +1"
riverctl map resize Super+Shift L send-layout-cmd rivertile "main-count -1"

# Super+Alt+{H,J,K,L} to move views
riverctl map resize Super+Alt H move left 100
riverctl map resize Super+Alt J move down 100
riverctl map resize Super+Alt K move up 100
riverctl map resize Super+Alt L move right 100

# Super+Alt+Control+{H,J,K,L} to snap views to screen edges
riverctl map resize Super+Alt+Control H snap left
riverctl map resize Super+Alt+Control J snap down
riverctl map resize Super+Alt+Control K snap up
riverctl map resize Super+Alt+Control L snap right

# Super+Alt+Shift+{H,J,K,L} to resize views
riverctl map resize Super+Alt+Shift H resize horizontal -100
riverctl map resize Super+Alt+Shift J resize vertical 100
riverctl map resize Super+Alt+Shift K resize vertical -100
riverctl map resize Super+Alt+Shift L resize horizontal 100

# Super + Left Mouse Button to move views
riverctl map-pointer resize Super BTN_LEFT move-view

# Super + Right Mouse Button to resize views
riverctl map-pointer resize Super BTN_RIGHT resize-view
