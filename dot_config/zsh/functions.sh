function zvm_config() {
  ZVM_SYSTEM_CLIPBOARD_ENABLED=true
}
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

is_dark_mode() {
  if [[ "$OSTYPE" == darwin* ]]; then
    [[ $(defaults read -g AppleInterfaceStyle 2>/dev/null) == "Dark" ]]
  else
    return 1
  fi
}

op() {
  local cwd="$(pwd)"
  if [[ $cwd = "$HOME" ]]; then
    mkdir -p ~/.omp/scratch
    cd ~/.omp/scratch && omp "$@" --no-lsp --no-extensions --no-skills
    cd "$HOME" || echo "Failed to return to home directory"
  else
    omp "$@" --no-lsp --no-extensions --no-skills
  fi
}

# source "$HOME/Documents/AppConf/sing-box/toggle.sh"
