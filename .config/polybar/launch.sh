#!/usr/bin/env zsh

# Terminate already running bar instances
killall -q polybar

polybar -c $HOME/.config/polybar/config.ini top >> $HOME/.logs/polybar.log 2>&1 & disown
