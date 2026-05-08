export PATH="/usr/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

bindkey -v
export KEYTIMEOUT=1

export EDITOR='nvim'
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

setopt AUTO_CD
if [[ -z "$TMUX" ]]; then
    if tmux has-session -t home 2>/dev/null; then
        tmux attach -t "home"
    else
        tmux new -s "home"
    fi
fi
# aliases
alias ls='ls -A --color=always --group-directories-first'
alias vim="nvim"
alias gamma="pkill wl-gammarelay && hyprctl dispatch exec wl-gammarelay"
alias hotspot='nmcli connection up "slick’s iPhone"'

# skim setup
if [[ -r /usr/share/skim/key-bindings.zsh ]]; then
  source /usr/share/skim/key-bindings.zsh
fi
if [[ -r /usr/share/skim/completion.zsh ]]; then
  source /usr/share/skim/completion.zsh
fi
export SKIM_DEFAULT_COMMAND='fd --type f --type d --hidden --follow --exclude .git'
export SKIM_CTRL_T_COMMAND='fd  --type f --hidden --follow --exclude .git'
export SKIM_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export SKIM_DEFAULT_OPTIONS='--color bw --ansi --reverse --prompt="$ "'
PATH_COL="#808080"
GIT="#505050"
RED="#B07070"
SYMBOL="#A0A0A0"
setopt PROMPT_SUBST
# git segment
prompt_git() {
  git rev-parse --is-inside-work-tree &>/dev/null || return

  local branch dirty=""
  branch=$(git symbolic-ref --short HEAD 2>/dev/null \
        || git describe --tags --exact-match 2>/dev/null \
        || git rev-parse --short HEAD 2>/dev/null)
  # Show red * if there are local changes
  if ! git diff --quiet 2>/dev/null || ! git diff --cached --quiet 2>/dev/null; then
    dirty="%F{$RED}*%f"
  fi
  print -n "%F{$GIT} git:${branch}${dirty}%f"
}
# prompt
PROMPT=$'%F{$PATH_COL}%~%f$(prompt_git)%F{$SYMBOL} $%f '
