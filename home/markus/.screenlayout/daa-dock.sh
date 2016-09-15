#!/bin/sh
xrandr --output VIRTUAL1 --off --output eDP1 --mode 1600x900 --pos 3840x300 --rotate normal --output DP1 --off --output DP2-1 --off --output DP2-2 --mode 1920x1200 --pos 0x0 --rotate normal --output DP2-3 --primary --mode 1920x1200 --pos 1920x0 --rotate normal --output HDMI2 --off --output HDMI1 --off --output DP2 --off

switch-pulse-sink 1
