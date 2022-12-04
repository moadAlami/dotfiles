#!/usr/bin/env sh

[ -f ~/.xprofile ] && . ~/.xprofile

dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

while true; do
	dwm 2> ~/.config/dwm.log
done
