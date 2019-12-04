#!/usr/bin/env sh

[ -f ~/.xprofile ] && . ~/.xprofile

$HOME/.fehbg

# exec i3
exec dwm
