#!/bin/sh
xrandr --output VIRTUAL1 --off --output eDP1 --off --output DP1 --off --output HDMI2 --off --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP2 --mode 1680x1050 --pos 1920x0 --rotate normal

switch-pulse-sink 0
