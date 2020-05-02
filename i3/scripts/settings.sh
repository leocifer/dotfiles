#!/bin/sh

ask=`zenity --list --title="Settings" --column="0" "Audio" "Display" "Network Connections" "Mouse and Keyboard" "Polybar Config" "i3 Config" --width=100 --height=300 --hide-header`

if [ "$ask" == "Audio" ]; then
	pavucontrol
fi

if [ "$ask" == "Display" ]; then
	arandr
fi

if [ "$ask" == "Network Connections" ]; then
	nm-connection-editor
fi


if [ "$ask" == "Polybar Config" ]; then
	st -e vim ~/.config/polybar/config
fi

if [ "$ask" == "i3 Config" ]; then
	st -e  ~/.config/i3/config
fi

if [ "$ask" == "Mouse and Keyboard" ]; then
	lxinput
fi

exit 0
