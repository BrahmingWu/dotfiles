# bindkey -M viins '\e.' insert-last-word
# bindkey -M vicmd '\e.' insert-last-word
#

# Set up fzf key bindings and fuzzy completion

function zvm_after_init() {
  source <(fzf --zsh)
}

source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

