#!/bin/sh

alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias ip="ip --color=auto"

alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"

alias la="eza -a --icons --group-directories-first"
alias ll="eza -alghF --icons --group-directories-first"
alias ls="eza --icons --group-directories-first"
alias lt="eza -alghF --icons --group-directories-first --tree"

alias g="git"
alias t="tmux a 2> /dev/null || tmux new-session -c $HOME"
alias v="nvim"
