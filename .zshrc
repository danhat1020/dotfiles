export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export PATH="$HOME/bin:$PATH"

CASE_SENSITIVE="false"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

zstyle ':omz:update' mode auto      # update automatically without asking

zstyle ':omz:update' frequency 7

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

eval $(oh-my-posh init zsh --config "~/.config/oh-my-posh/zen.toml")

bindkey -v
export KEYTIMEOUT=1

# User configuration

# aliases
alias ls="eza -a --show-symlinks --color=always --icons=always --sort=name --git-ignore --group-directories-first"
alias tree="eza --all --tree --git-ignore"
alias icat="kitten icat"
alias showcolor="curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/e50a28ec54188d2413518788de6c6367ffcea4f7/print256colours.sh | zsh"
alias rm="rm -rf"
alias vim="nvim"
alias bonsai="cbonsai --live --time=0.015 --infinite --wait=1.00 --leaf=\?,\&,\$ --color=2,130,77,3 --multiplier=8 --life=60"
alias matrix="cmatrix -bk"

alias gamma="pkill wl-gammarelay && hyprctl dispatch exec wl-gammarelay"

alias dn="dotnet"

alias comp="gcc main.c -o main"

alias cr="cargo run"
alias cb="cargo build"
alias cn="cargo new"

# fzf setup
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="fd -p --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -p --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_DEFAULT_OPTS="--height 80% --layout=reverse --border --color=hl:#505050"
export FZF_TMUX_OPTS=" -p90%,70% "

export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
