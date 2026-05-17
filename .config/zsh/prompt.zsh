##### PROMPT #####
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
