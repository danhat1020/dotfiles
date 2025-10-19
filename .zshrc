export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/bin:$PATH"

CASE_SENSITIVE="false"

zstyle ':omz:update' mode auto      # update automatically without asking

zstyle ':omz:update' frequency 7

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

eval $(oh-my-posh init zsh --config "~/.config/oh-my-posh/zen.toml")

# User configuration

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias ls="eza -a --show-symlinks --color=always --icons=always --sort=name --git-ignore --group-directories-first"
alias tree="eza --all --tree --git-ignore"
alias icat="kitten icat"
alias showcolor="curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/e50a28ec54188d2413518788de6c6367ffcea4f7/print256colours.sh | zsh"
alias rm="rm -rf"
alias vim="nvim"

alias gamma="pkill wl-gammarelay && hyprctl dispatch exec wl-gammarelay"

alias dn="dotnet"

alias cr="cargo run"
alias cb="cargo build"
alias cn="cargo new"

eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="fd -p --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -p --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_DEFAULT_OPTS="--height 80% --layout=reverse --border --color=hl:#505050"
export FZF_TMUX_OPTS=" -p90%,70% "

export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
