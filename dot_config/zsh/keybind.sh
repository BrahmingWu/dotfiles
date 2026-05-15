function zvm_after_init() {
  eval "$(tv init zsh)"
  eval "$(atuin init zsh)"
}

# function zvm_after_lazy_keybings() {
#   bindkey -M vicmd '.' insert-last-word
# }
source "$(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
