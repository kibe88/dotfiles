source ${HOME}/.functions
source ${HOME}/.exports
source ${HOME}/.path
source ${HOME}/.aliases
source /usr/local/opt/fzf/shell/key-bindings.zsh
source /usr/local/opt/fzf/shell/completion.zsh
source ${HOME}/dotfiles/shell-extensions/fzf

if is_osx; then
  source ${HOME}/.osx
fi

source ~/.zshrc.zgen
