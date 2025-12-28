#!/bin/sh

feh --no-fehbg --bg-scale ~/Pictures/Wallpapers/amdgruvred.png
setxkbmap us,ru -option 'grp:lalt_lshift_toggle'
dwmblocks &
redshift -O 3400K

while true; do
	# dwm 2>~/.dwm.log
	dwm >/dev/null 2>&1
done
