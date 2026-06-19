##### HISTORY #####
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

##### SHELL BEHAVIOUR #####
setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT # sort file10 after file9, not after file1

##### COMPLETION #####
zstyle ':completion:*' menu select                     # enable interactive completion menu selection
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # make completion case-insensitive

##### FZF #####
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
fi

##### MODULAR CONFIG #####
source "$ZDOTDIR/fzf.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/prompt.zsh"
source "$ZDOTDIR/tmux.zsh"
