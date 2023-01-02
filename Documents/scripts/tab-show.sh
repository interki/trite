#!/bin/sh

# qutebrowser userscript
# Set buffer to command line and tabs.show to always. When leaving the command mode, set tabs.show to switching.

fifo="$QUTE_FIFO"

case "$1" in
	0)
		echo "bind --mode command <Escape> mode-leave" >> $fifo
		echo "bind --mode command <Return> command-accept" >> $fifo
		;;
	*)
		echo "set-cmd-text -s :buffer ;; set tabs.show always ;; set statusbar.show always" >> $fifo
		echo "bind --mode command <Escape> mode-leave ;; set tabs.show switching ;; set statusbar.show in-mode ;; spawn --userscript $(basename "$0") 0" >> $fifo
		echo "bind --mode command <Return> command-accept ;; set tabs.show switching ;; set statusbar.show in-mode ;; spawn --userscript $(basename "$0") 0" >> $fifo
		;;
esac
