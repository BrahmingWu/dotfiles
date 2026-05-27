export XDG_CONFIG_HOME="$HOME/.config"
export _ZO_DATA_DIR="$HOME/Documents/AppData/zoxide/"
export LANG=en_US.UTF-8

export PATH="$PATH:$HOME/.local/bin"

# export https_proxy=http://127.0.0.1:20122 http_proxy=http://127.0.0.1:20122 all_proxy=socks5://127.0.0.1:20122

if [ -f ~/.env ]; then
  set -a
  source ~/.env
  set +a
fi
