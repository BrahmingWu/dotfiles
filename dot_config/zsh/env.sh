export XDG_CONFIG_HOME="$HOME/.config"
export _ZO_DATA_DIR="$HOME/Documents/AppData/zoxide/"
export LANG=en_US.UTF-8
export KEYTIMEOUT=1
export PATH="$PATH:$HOME/.local/bin:$HOME/.local/share/nvim/mason/bin"
#export http_proxy="http://192.168.18.181:20122"
#export https_proxy="http://192.168.18.181:20122"
#export no_proxy="localhost,127.0.0.1,.local" NO_PROXY="localhost,127.0.0.1,.local"

if [ -f ~/.env ]; then
  set -a
  source ~/.env
  set +a
fi
