function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
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
