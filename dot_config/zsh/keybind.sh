bindkey -v
bindkey -M vicmd '.' insert-last-word

bindkey -M viins 'jj' vi-cmd-mode
bindkey -M viins '\e[3~' delete-char
bindkey -M viins '^?' backward-delete-char
# 强大的补全菜单：可以用方向键，甚至 hjkl 在菜单里移动！
# zstyle ':completion:*' menu select

