export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export TERMINAL=/usr/bin/terminator

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
