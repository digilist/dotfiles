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

# Activate numlock
numlockx

# Startup applications
compton &
pcmanfm -d &
caffeine &

# Configure powersavings and security
xss-lock -n ~/.bin/dim-screen -- ~/.bin/lock & # automatic screen locking on several events (inactivity, suspend, ...)
xset s 150 150
xset dpms 1800 0 0 # standy after 30 minutes

# Configure inputs
xinput set-prop "TPPS/2 Elan TrackPoint" "libinput Accel Speed" 0.7
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Accel Speed" 0.7

# Configure QT to use theme configured with qt5ct (to align with GTK)
export QT_QPA_PLATFORMTHEME="qt5ct"

# Start i3
exec i3
