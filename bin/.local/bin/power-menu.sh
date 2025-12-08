#!/bin/sh

selected=$(printf "Power Off\nReboot\nSleep\nLock\nLogout" | walker -p "Power Menu" --dmenu | tr "[:upper:]" "[:lower:]" | tr -d "[:space:]")
[ -z "$selected" ] && exit 0

case "$selected" in
"lock") hyprlock ;;
"logout") loginctl terminate-user "$USER" ;;
"poweroff") systemctl poweroff ;;
"reboot") systemctl reboot ;;
"sleep")
    systemctl suspend
    hyprlock &
    ;;
esac
