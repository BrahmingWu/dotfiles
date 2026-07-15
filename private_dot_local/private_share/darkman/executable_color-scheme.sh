#!/usr/bin/env bash
# Darkman hook: propagate color scheme to shell env, GTK, waybar, mako, swaybg.
# Called by darkman on mode switch, and by darkman-mode-sync.service at session start.
# Each step is guarded; this script never aborts on partial failure.

# Resolve mode: from arg (darkman) or from cache (sync service)
if [ "$1" = "dark" ] || [ "$1" = "light" ]; then
    MODE="$1"
else
    MODE="$(cat ~/.cache/color-scheme 2>/dev/null || echo "dark")"
fi

# 1. Write cache file for shell (is_dark_mode in functions.sh)
echo "$MODE" > ~/.cache/color-scheme

# 2. Set GTK4 / libadwaita color scheme
gsettings set org.gnome.desktop.interface color-scheme \
    "$([ "$MODE" = "dark" ] && echo "prefer-dark" || echo "prefer-light")" 2>/dev/null || true

# # 3. Reload waybar (picks up style-dark.css / style-light.css)
# pkill -SIGUSR2 waybar 2>/dev/null || true
#
# # 4. Sync mako notification mode (only when mako D-Bus is ready)
# if busctl --user list 2>/dev/null | grep -q '^org\.freedesktop\.Notifications[[:space:]]*[0-9]'; then
#     makoctl mode -s "$MODE"
# fi
#
# # 5. Switch wallpaper for swaybg (managed as systemd service)
# WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
# case "$MODE" in
#     dark)  WALLPAPER_FILE="$WALLPAPER_DIR/wallhaven_e8wvww.jpg"  ;;
#     light) WALLPAPER_FILE="$WALLPAPER_DIR/wallhaven_6lw77w.jpg"  ;;
# esac
# WALLPAPER_LINK="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}/swaybg-wallpaper"
#
# CURRENT_TARGET="$(readlink "$WALLPAPER_LINK" 2>/dev/null || echo "")"
# ln -sf "$WALLPAPER_FILE" "$WALLPAPER_LINK"
#
# # Only restart swaybg when wallpaper actually changed (avoids unnecessary bounce on session start)
# if [ "$CURRENT_TARGET" != "$WALLPAPER_FILE" ]; then
#     systemctl --user is-active --quiet swaybg.service && systemctl --user restart swaybg.service
# fi
