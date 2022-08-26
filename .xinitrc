#!/usr/bin/env sh

[ -f ~/.xprofile ] && . ~/.xprofile

# $HOME/.fehbg

while true; do
	dwm 2> ~/.config/dwm.log
done
