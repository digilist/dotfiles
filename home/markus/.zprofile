#!/bin/sh

export EDITOR=/usr/bin/vim   
export VISUAL=/usr/bin/vim
export TERMINAL=/usr/bin/terminator

# Extend PATH variable
export PATH="$PATH:$HOME/.bin"
export PATH="$HOME/.symfony/bin:$PATH"

# Start ssh-agent if not already started
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent | grep -v "echo Agent pid" > ~/.ssh-agent-config
fi

# Reload ssh-agent configuration (in case the global one terminated and a new one was started)
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<~/.ssh-agent-config)"
fi

if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    echo -n "Going into i3, press Ctrl+C to cancel... "
    sleep 2

    startx
fi
