export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export TERMINAL=/usr/bin/terminator
# export PATH="bin:vendor/bin:$HOME/bin:$HOME/.composer/vendor/bin:$PATH:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
export PATH="./bin:./vendor/bin:$HOME/bin:$HOME/.composer/vendor/bin:$PATH"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
