#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Set keyboard layout
setxkbmap de

# Activate numlock
numlockx

# Set primary display
xrandr --output eDP1 --primary
# xrandr --output DP1 --primary

# Lockscreen
xautolock -time 10 -detectsleep -locker ~/.xlock &
pidof xss-lock || xss-lock -- ~/.xlock &
xscreensaver -no-splash &

# Startup applications
parcellite &
xcompmgr &
pcmanfm -d &
dropbox &
keepassx -min -lock &
owncloud &
redshift-gtk &
dunst &

# Start i3
exec i3
