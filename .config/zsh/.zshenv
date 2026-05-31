# ~/.config/zsh/.zshenv

##### XDG base dirs #####
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

##### editor #####
export EDITOR="nvim"
export VISUAL="nvim"

##### path #####
export PATH="/usr/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"

##### vim #####
export VIMINIT='if has("nvim") | source $XDG_CONFIG_HOME/nvim/init.lua | else | let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC | endif'
