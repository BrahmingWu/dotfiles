# catppuccin latte
FZF_COLOR_LIGHT=" \
--color=bg+:#CCD0DA,spinner:#DC8A78,hl:#D20F39 \
--color=fg:#4C4F69,header:#D20F39,info:#8839EF,pointer:#DC8A78 \
--color=marker:#7287FD,fg+:#4C4F69,prompt:#8839EF,hl+:#D20F39 \
--color=selected-bg:#BCC0CC \
--color=border:#9CA0B0,label:#4C4F69"

# catppuccin macchiato
FZF_COLOR_DARK=" \
--color=bg+:#363A4F,spinner:#F4DBD6,hl:#ED8796 \
--color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
--color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
--color=selected-bg:#494D64 \
--color=border:#6E738D,label:#CAD3F5"

MY_FZF_THEME=$(is_dark_mode && echo "$FZF_COLOR_DARK" || echo "$FZF_COLOR_LIGHT")

export FZF_DEFAULT_OPTS="${MY_FZF_THEME}
  --style minimal
  --walker-skip .git,node_modules,target,.Trash,.cache
  --preview 'if [[ -d {} ]];
      then eza --color=always -TL2 {} ; 
    elif [[ \$(file --mime-encoding -b {}) =~ binary ]];
      then mcat {} 2> /dev/null || file {};
    else bat -p --theme=auto:system --color=always {};
    fi'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'
"
export FZF_CTRL_R_OPTS="${MY_THEME}
  --style minimal
  --info inline
  --no-sort
  --no-preview
"
export FZF_CTRL_T_OPTS="${MY_THEME}
  --walker-skip .git,node_modules,target,.Trash,.cache
  --preview 'bat -n --theme=auto:system --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_ALT_C_OPTS="${MY_THEME}
  --walker-skip .git,node_modules,target,.Trash
  --preview 'eza --color=always -TL2 {}'"
# ripgrep->fzf->vim [QUERY]
rfv() (
  RELOAD='reload:rg --column --color=always --smart-case {q} || :'
  OPENER='if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
            nvim {1} +{2}     # No selection. Open the current line in Vim.
          else
            nvim +cw -q {+f}  # Build quickfix list for the selected items.
          fi'
  fzf --disabled --ansi --multi \
    --bind "start:$RELOAD" --bind "change:$RELOAD" \
    --bind "enter:become:$OPENER" \
    --bind "ctrl-o:execute:$OPENER" \
    --bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
    --delimiter : \
    --preview 'bat --theme=auto:system --style=full --color=always --highlight-line {2} {1}' \
    --preview-window '~4,+{2}+4/3,<80(up)' \
    --query "$*"
)
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

export MCAT_THEME=$(is_dark_mode && echo "catppuccin" || echo "makurai-light")
