source ${HOME}/.functions
source ${HOME}/.exports
source ${HOME}/.path

if is_osx; then
  source ${HOME}/.osx
fi

source ${HOME}/.zshrc.zplug
source ${HOME}/.aliases
source /usr/local/opt/fzf/shell/key-bindings.zsh
source /usr/local/opt/fzf/shell/completion.zsh
