bindkey -v
bindkey -M vicmd '.' insert-last-word

bindkey -M viins 'jj' vi-cmd-mode
bindkey -M viins '\e[3~' delete-char
bindkey -M viins '^?' backward-delete-char
