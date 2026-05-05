#!/usr/bin/env bash

CONFIG="$HOME/.config/kitty/kitty.conf"

current=$(grep "^cursor_trail " "$CONFIG" | awk '{print $2}')
current=${current:-0}

if [ "$current" = "0" ]; then
	new_value="1"
else
	new_value="0"
fi

if grep -q "^cursor_trail " "$CONFIG"; then
	sed -i "s/^cursor_trail .*/cursor_trail $new_value/" "$CONFIG"
else
	echo "cursor_trail $new_value" >> "$CONFIG"
fi

killall -SIGUSR1 kitty
