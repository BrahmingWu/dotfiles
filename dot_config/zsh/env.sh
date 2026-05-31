export XDG_CONFIG_HOME="$HOME/.config"
export _ZO_DATA_DIR="$HOME/Documents/AppData/zoxide/"
export LANG=en_US.UTF-8
export KEYTIMEOUT=1
export PATH="$PATH:$HOME/.local/bin:$HOME/.local/share/nvim/mason/bin"

if [ -f ~/.env ]; then
  set -a
  source ~/.env
  set +a
fi
