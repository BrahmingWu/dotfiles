export EDITOR="nvim"
export XDG_CONFIG_HOME="$HOME/.config"
export EZA_ICONS_AUTO="auto"
export _ZO_DATA_DIR="$HOME/Documents/App/zoxide/"
export _ZO_ECHO=1
export ZELLIJ_AUTO_EXIT="true"
export LESS="-FRXM -j 5"
# export ZELLIJ_AUTO_ATTACH="true"

export PATH="$PATH:$HOME/.local/bin"
#export MANPAGER='nvim +Man!'
export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"
export PAGER="less"

export FX_THEME="1"

export https_proxy=http://127.0.0.1:20122 http_proxy=http://127.0.0.1:20122 all_proxy=socks5://127.0.0.1:20122

