##### FZF #####
export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --exclude=.git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND --type f"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
export FZF_DEFAULT_OPTS='--height 80% --layout=reverse --color=bw'
export FZF_CTRL_T_OPTS='--height 80% --layout=reverse --color=bw --preview "bat --style=numbers --color=always {}"'
