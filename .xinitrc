~/Documents/scripts/dwm_status &
redshift -l -27.469770:153.025131 -t 6500k:3500k &
python ~/Documents/scripts/clipz.py &
#onedrive -m &
clipmenud &

[[ -f ~/.xmodmap ]] && xmodmap ~/.xmodmap

exec /usr/local/bin/dwm
