#!/bin/sh

# profile file - runs on login

##### XDG BASE DIRS #####
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
##### EDITOR #####
export EDITOR="nvim"
export TERMINAL="kitty"
##### PATH #####
export PATH="/usr/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"
##### raylib #####
export LSAN_OPTIONS=suppressions=/home/slickfm/lsan.supp:print_suppressions=0

[ -f ~/.bashrc ] && source ~/.bashrc
