autoload -U colors && colors

export TERM="ghostty"

plugins=(git)

export LANG=en_US.UTF-8
export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/bin:$PATH"

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

alias ls="eza -a --show-symlinks --color=always --icons=always --sort=name --git-ignore --group-directories-first"
alias tree="eza --all --tree --git-ignore"
alias icat="kitten icat"
alias logo="clear && fastfetch"
alias vim="nvim"
alias showcolor="curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/e50a28ec54188d2413518788de6c6367ffcea4f7/print256colours.sh | zsh"
alias rm="rm -rf"

alias gamma="pkill wl-gammarelay && hyprctl dispatch exec wl-gammarelay"

alias dn="dotnet"

alias cr="cargo run"
alias cb="cargo build"
alias cn="cargo new"

alias commit="git commit -m"

eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="fd -p --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -p --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_DEFAULT_OPTS="--height 80% --layout=reverse --border --color=hl:#505050"
export FZF_TMUX_OPTS=" -p90%,70% "

export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

DISABLE_AUTO_TITLE="true"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export XCURSOR_SIZE=30

setopt PROMPT_SUBST

# Function to get git branch and status
git_prompt() {
  # Check if we're in a git repository
  if git rev-parse --git-dir > /dev/null 2>&1; then
    # Get the current branch name
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)

    # Get git status
    local git_status=""
    if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
      git_status=" ${GITST}[!]"  # Indicate there are changes
    fi

    # Return the formatted git info
    echo "${GREY}in ${GIT} ${branch}${git_status}"
  fi
}

GREY=$'%{\e[38;5;246m%}'
SYM=$'%{\e[38;5;1m%}'
GITST=$'%{\e[38;5;166m%}'
GIT=$'%{\e[38;5;62m%}'
DIR=$'%{\e[38;5;133m%}'

RESET_COLOR=$'%{\e[0m%}'

# λ
PROMPT='${DIR}%~${RESET_COLOR}$(if [[ -n $(git_prompt) ]]; then echo " $(git_prompt)${RESET_COLOR}"; fi) ${SYM}$ ${RESET_COLOR}'
