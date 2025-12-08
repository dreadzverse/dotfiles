#!/bin/sh

selected="$(find "$DOTFILES_HOME" -type f ! -path "*.git/*" | sed "s|^$DOTFILES_HOME/||" | sort | fzf --preview "bat -n --color always $DOTFILES_HOME/{}")"
[ -z "$selected" ] && exit 0
path="$DOTFILES_HOME/$selected"
name="$(echo "${selected#/*/*/}" | tr "/." "_")"
if tmux lsw | grep -q ": $name"; then
    tmux selectw -t "$name"
else
    tmux neww -n "$name" -c sh "nvim $path"
fi
