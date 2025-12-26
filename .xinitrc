~/Documents/scripts/dwm_status &
#redshift -l -27.469770:153.025131 -t 6500k:3500k &
python ~/Documents/scripts/clipz.py &
onedrive -m &
clipmenud &
xset s off -dpms
#xrandr --output LVDS-1 --off
~/.local/share/tresorit/tresorit-cli start &

[[ -f ~/.xmodmap ]] && xmodmap ~/.xmodmap

#exec /usr/local/bin/dwm
while type dwm >/dev/null ; do dwm && continue || break ; done
