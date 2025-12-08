#!/bin/sh

PROFILES_DIR="$XDG_DATA_HOME/git-profiles"

if ! command -v git >/dev/null; then
    echo "Git is not installed"
    exit 1
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "The current dir is not a git repository"
    exit 1
fi

if ! [ -d "$PROFILES_DIR" ]; then
    echo "Git profiles dir does not exists"
    exit 1
fi

selected="$(find "$PROFILES_DIR" -mindepth 1 -maxdepth 1 -type d | sed "s|^$PROFILES_DIR/||" | sort | fzf)"
[ -z "$selected" ] && exit 0
selected="$PROFILES_DIR/$selected"

name="$(cat "$selected/name")"
email="$(cat "$selected/email")"
# ssh_key="$(cat "$selected/ssh-key")"

git config --local user.name "$name"
git config --local user.email "$email"
# git config --local core.sshCommand "ssh -i ~/.ssh/$ssh_key -o IdentitiesOnly=yes"

echo "$name <$email> applied as git profile to this repository"
