#!/bin/sh
set -e
# version: 1

# Only run on Linux (macOS uses OrbStack automatic DNS)
case "$(uname -s)" in
  Linux) ;;
  *) exit 0 ;;
esac

log() { echo "hosts-local: $*"; }

# Add .local domains to /etc/hosts for Caddy reverse proxy
HOSTS_FILE="/etc/hosts"
DOMAINS="vw.local mem.local"

for domain in $DOMAINS; do
  if ! grep -q "$domain" "$HOSTS_FILE" 2>/dev/null; then
    echo "127.0.0.1 $domain" | sudo tee -a "$HOSTS_FILE" > /dev/null
    log "added $domain"
  fi
done
