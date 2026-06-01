znap eval starship 'starship init zsh --print-full-init'
znap prompt
znap eval zoxide 'zoxide init zsh'
znap eval mise 'mise activate zsh'
znap eval tv 'tv init zsh'
znap eval atuin 'atuin init zsh'
znap eval omp 'omp completions zsh'
# znap eval zellij 'zellij setup --generate-auto-start zsh'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
znap source zsh-users/zsh-syntax-highlighting
znap source zsh-users/zsh-autosuggestions
