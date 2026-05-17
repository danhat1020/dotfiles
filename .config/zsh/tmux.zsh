##### TMUX #####
if [[ -z "$TMUX" ]]; then
    if tmux has-session -t home 2>/dev/null; then
        tmux attach -t "home"
    else
        tmux new -s "home"
    fi
fi
