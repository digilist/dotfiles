export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export TERMINAL=/usr/bin/terminator
export PATH="./bin:./vendor/bin:./node_modules/.bin:$HOME/bin:$HOME/.composer/vendor/bin:$HOME/.cabal/bin:$PATH"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
