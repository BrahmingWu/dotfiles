if [[ ! -d ~/.zsh-plugins/znap ]]; then
  echo "Installing Znap..."
  git clone --depth 1 https://github.com/marlonrichert/zsh-snap.git ~/.zsh-plugins/znap
fi

source ~/.zsh-plugins/znap/znap.zsh
