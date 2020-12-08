#!/usr/bin/env sh

[ -f ~/.xprofile ] && . ~/.xprofile

$HOME/.fehbg

# exec i3
while true; do
	dwm 2> ~/.config/dwm.log
done
