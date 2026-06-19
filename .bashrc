#  ================================
#   _               _              
#  | |__   __ _ ___| |__  _ __ ___ 
#  | '_ \ / _` / __| '_ \| '__/ __|
#  | |_) | (_| \__ \ | | | | | (__ 
#  |_.__/ \__,_|___/_| |_|_|  \___|
#                                  
#  ================================

# options
stty -ixon
shopt -s histappend
shopt -s checkwinsize
shopt -s globstar
shopt -s autocd   2>/dev/null || true
shopt -s dirspell 2>/dev/null || true
shopt -s cdspell
shopt -s autocd
set -o vi

# history
HISTFILE="${XDG_STATE_HOME}/bash/history"
HISTSIZE=10000
HISTFILESIZE=200000
HISTCONTROL=ignoreboth

# aliases
alias ls='ls -AhN --color=auto --group-directories-first'
alias vi='nvim'
alias grep='grep --color=always -nI'
alias tree='tree -Ca -I ".git|node_modules|vendor|__pycache__" --dirsfirst'
alias sbc='source ~/.bashrc'
alias mkdir='mkdir -pv'

# prompt
RESET='\[\e[0m\]'
DARK_GREY='\[\e[0;90m\]'
GREY='\[\e[0;37m\]'
WHITE='\[\e[0;97m\]'
export PS1="${DARK_GREY}\u@\h:${GREY}\w ${WHITE}$ ${RESET}"
export PS2="${DARK_GREY}> ${RESET}"
PROMPT_COMMAND='history -a'

# fzf
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude=.git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND --type f"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
export FZF_DEFAULT_OPTS='--layout=reverse --color=bw'
export FZF_CTRL_T_OPTS='--layout=reverse --color=bw --preview "bat --style=numbers --color=always {}"'

# functions
ts() {
  if ! tmux has-session -t home 2>/dev/null; then
    tmux new -s home
  else
    tmux attach -t home
  fi
}

mkcd() {
  mkdir -p "$1" && cd "$1"
}

rmcd() {
  CWD="$(pwd)"
  cd ..
  rm -rf $CWD
}

path() {
  echo "$PATH" | tr ":" "\n"
}
