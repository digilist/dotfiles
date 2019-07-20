export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export TERMINAL=/usr/bin/terminator
export PATH="$PATH:$HOME/bin:$HOME/.local/bin./bin:./vendor/bin:./node_modules/.bin:tools:$HOME/.composer/vendor/bin:$HOME/.cabal/bin"

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent | grep -v "echo Agent pid" > ~/.ssh-agent-thing
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
