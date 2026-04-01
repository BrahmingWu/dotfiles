export FZF_DEFAULT_OPTS="
  --style minimal
  --preview 'if [[ -d {} ]]; 
      then eza -TL2 {} ; 
    elif [[ \$(file --mime-encoding -b {}) =~ binary ]];
      then mcat {} 2> /dev/null || file {};
    else bat -p --theme=auto:system --color=always {};
    fi'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'
"
export FZF_CTRL_R_OPTS="
  --style minimal
  --info inline
  --no-sort
  --no-preview
"

export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'eza -TL2 {}'"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
