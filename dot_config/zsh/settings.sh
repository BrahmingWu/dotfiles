# fzf catppuccin latte
FZF_COLOR_LIGHT=" \
--color=bg+:#CCD0DA,spinner:#DC8A78,hl:#D20F39 \
--color=fg:#4C4F69,header:#D20F39,info:#8839EF,pointer:#DC8A78 \
--color=marker:#7287FD,fg+:#4C4F69,prompt:#8839EF,hl+:#D20F39 \
--color=selected-bg:#BCC0CC \
--color=border:#9CA0B0,label:#4C4F69"

# fzf catppuccin macchiato
FZF_COLOR_DARK=" \
--color=bg+:#363A4F,spinner:#F4DBD6,hl:#ED8796 \
--color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
--color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
--color=selected-bg:#494D64 \
--color=border:#6E738D,label:#CAD3F5"

_is_dark=false
is_dark_mode && _is_dark=true

if [[ $_is_dark == true ]]; then
  MY_FZF_THEME=$FZF_COLOR_DARK
  LG_CONFIG_FILE="$XDG_CONFIG_HOME/lazygit/config.yml,$XDG_CONFIG_HOME/lazygit/theme_dark.yml"
  MCAT_THEME=catppuccin
else
  MY_FZF_THEME=$FZF_COLOR_LIGHT
  LG_CONFIG_FILE="$XDG_CONFIG_HOME/lazygit/config.yml,$XDG_CONFIG_HOME/lazygit/theme_light.yml"
  MCAT_THEME=makurai-light
fi
export MCAT_THEME

export FZF_DEFAULT_OPTS="${MY_FZF_THEME}
  --style minimal
  --info inline-right
  --walker-skip .git,node_modules,target,.Trash,.cache
  --preview 'if [[ -d {} ]];
      then eza --color=always -TL2 {} ; 
    elif [[ \$(file --mime-encoding -b {}) =~ binary ]];
      then mcat {} 2> /dev/null || file {};
    else bat -p --color=always {};
    fi'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'
"
export FZF_CTRL_R_OPTS="
  --no-sort
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'
  --no-preview
"

export FZF_CTRL_T_OPTS="
  --select-1 --exit-0
"

export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target,.Trash
  --preview 'eza --color=always -TL2 {}'"

rfv() (
  RELOAD='reload:rg --column --color=always --smart-case {q} || :'
  OPENER='if [[ $FZM_SELECT_COUNT -eq 0 ]]; then
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
    --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
    --preview-window '~4,+{2}+4/3,<80(up)' \
    --query "$*"
)

export EDITOR="nvim"
export EZA_ICONS_AUTO="auto"
export _ZO_ECHO=1
export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"
export PAGER="less"

export FX_THEME="1"
export LESS="-FRXM -j 5"

export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_INSTALL_FROM_API=1
