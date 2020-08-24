#!/usr/bin/env zsh

# Terminate already running bar instances
killall -q polybar

polybar top >> $HOME/polybar.log 2>&1 & disown
