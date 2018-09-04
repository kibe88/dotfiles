source ${HOME}/.functions
source ${HOME}/.exports
source ${HOME}/.path
source ${HOME}/dotfiles/shell-extensions/fzf/fzf.sh

if is_osx; then
  source ${HOME}/.osx
fi

source ${HOME}/.zshrc.zgen
source ${HOME}/.aliases
source /usr/local/opt/fzf/shell/key-bindings.zsh
source /usr/local/opt/fzf/shell/completion.zsh
