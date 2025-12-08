#!/bin/sh

export XDG_CACHE_HOME="${XDG_CACHE_HOME:=$HOME/.cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:=$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:=$HOME/.local/state}"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export GNUPGHOME="$XDG_DATA_HOME/gnupg"

export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

export GOCACHE="$XDG_CACHE_HOME/go/mod"
export GOPATH="$XDG_DATA_HOME/go"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_PREFIX="$XDG_DATA_HOME/npm"

export PSQL_HISTORY="$XDG_CACHE_HOME/psql-history"
export SQLITE_HISTORY="$XDG_CACHE_HOME/sqlite-history"

export LESSHISTFILE="$XDG_CACHE_HOME/less-history"

export DOTFILES_HOME="$HOME/.local/share/dotfiles"
export PROJECTS_HOME="$HOME/hacking"

export BROWSER="chromium"
export EDITOR="nvim"
export TERMINAL="alacritty"
export WM="Hyprland"

append_path() {
    case ":$PATH:" in
    *:"$1":*) ;;
    *) PATH="${PATH:+$PATH:}$1" ;;
    esac
}

append_path "$HOME/.local/bin"
append_path "$GOPATH/bin"
append_path "$XDG_DATA_HOME/npm/bin"

unset -f append_path

export PATH

[ -d "$GNUPGHOME" ] || mkdir -p "$GNUPGHOME" && chmod 700 "$GNUPGHOME"
[ -d "$PROJECTS_HOME" ] || mkdir -p "$PROJECTS_HOME"

if [ "$WM" = "Hyprland" ]; then
    export GDK_SCALE=1
    export HYPRCURSOR_SIZE=24
    export XCURSOR_SIZE=24
fi

[ "$(tty)" = /dev/tty1 ] && "$WM"
