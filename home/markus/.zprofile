#!/bin/sh

export EDITOR=/usr/bin/vim   
export VISUAL=/usr/bin/vim
export TERMINAL=/usr/bin/terminator
export PATH="$PATH:$HOME/.bin:$HOME/.local/bin./bin:./vendor/bin:tools:$HOME/.composer/vendor/bin:$HOME/.cabal/bin"

export PATH="$HOME/.symfony/bin:$PATH"

# Start ssh-agent if not already started
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent | grep -v "echo Agent pid" > ~/.ssh-agent-config
fi

# Reload ssh-agent configuration (in case the global one terminated and a new one was started)
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<~/.ssh-agent-config)"
fi

# Automatically start x on virtual terminal 1
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx
