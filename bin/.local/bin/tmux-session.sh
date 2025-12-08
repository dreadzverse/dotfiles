#!/bin/sh

selected="$(find "$PROJECTS_HOME" -mindepth 1 -maxdepth 1 -type d | sed "s|^$PROJECTS_HOME/||" | sort | fzf)"
[ -z "$selected" ] && exit 0
selected="$PROJECTS_HOME/$selected"
name="$(basename "$selected" | tr "." "_")"
tmux has-session -t "$name" 2>/dev/null || tmux new-session -ds "$name" -c "$selected"
tmux switch-client -t "$name"
