#!/usr/bin/env bash

CONFIG="$HOME/.config/kitty/kitty.conf"

current=$(grep "^font_size " "$CONFIG" | awk '{print $2}')
current=${current:-15}

if [ "$current" = "16.5" ]; then
  new_value="15"
else
  new_value="16.5"
fi

if grep -q "^font_size " "$CONFIG"; then
  sed -i "s/^font_size .*/font_size $new_value/" "$CONFIG"
else
  echo "font_size $new_value" >> "$CONFIG"
fi

killall -SIGUSR1 kitty
