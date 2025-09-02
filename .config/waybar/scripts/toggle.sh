#!/bin/bash

if pgrep -x "waybar" > /dev/null; then
  # waybar is running
  pkill -x "waybar"
else
  # waybar isn't running
  waybar &
fi
