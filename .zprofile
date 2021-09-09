# Autostart X using startx after login in tty1
[[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && exec startx
