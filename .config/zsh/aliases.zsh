##### ALIASES #####
alias ls='ls -A --color=always --group-directories-first'
# alias vim='nvim'
alias cat='bat'

_comp_completions() {
    local state

    _arguments \
        '1: :(build run clean)' \
        '*: :->files'

    if [[ $state == files ]]; then
        _files
    fi
}

compdef _comp_completions comp
