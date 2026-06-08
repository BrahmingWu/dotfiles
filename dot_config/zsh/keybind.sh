bindkey -v

_dot_insert_last_word() {
  if [[ -n "$LBUFFER" && "$LBUFFER[-1]" != " " ]]; then
    LBUFFER+=" "
  fi

  zle insert-last-word

  zle vi-insert
}
zle -N _dot_insert_last_word

bindkey -M vicmd '.' _dot_insert_last_word

bindkey -M viins 'jj' vi-cmd-mode
bindkey -M viins '\e[3~' delete-char
bindkey -M viins '^?' backward-delete-char
