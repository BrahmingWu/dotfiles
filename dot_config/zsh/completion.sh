zstyle ':completion:*' menu select

zstyle ':completion:*' matcher-list \
  'm:{[:lower:]}={[:upper:]}' \
  'r:|[._-]=* r:|=*'

zstyle ':completion:*' completer _complete _match
zstyle ':completion:*:match:*' original only
# zstyle ':completion:*:approximate:*' max-errors 1 numeric

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.m-1) ]]; then
  compinit -C
else
  compinit
fi
