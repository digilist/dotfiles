#!/bin/sh
xrandr --output eDP1 --primary --mode 1600x900 --pos 0x0 --rotate normal --output DP1 --off --output DP2-1 --off --output DP2-2 --off --output DP2-3 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --off

switch-pulse-sink 1
