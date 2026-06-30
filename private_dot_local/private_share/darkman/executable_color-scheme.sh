#!/usr/bin/env bash
# Darkman hook: propagate color scheme to shell env, GTK, waybar.
set -e

case "$1" in
  dark|light) ;;
  *) echo "Usage: $0 {dark|light}" >&2; exit 1 ;;
esac

MODE="$1"

# 1. Write cache file for shell (is_dark_mode in functions.sh)
echo "$MODE" > ~/.cache/color-scheme

# 2. Set GTK4 / libadwaita color scheme
gsettings set org.gnome.desktop.interface color-scheme \
  "$([ "$MODE" = "dark" ] && echo "prefer-dark" || echo "prefer-light")" 2>/dev/null || true

# 3. Reload waybar (picks up style-dark.css / style-light.css automatically)
pkill -SIGUSR2 waybar 2>/dev/null || true

# 4. Set mako notification mode
makoctl mode -s "$MODE"
