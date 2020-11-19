source ${HOME}/.functions
source ${HOME}/.exports
source ${HOME}/.path

source ${HOME}/.zshrc.zplug
source ${HOME}/.aliases

if is_osx; then
  source ${HOME}/.osx
fi

if is_linux; then
  source ${HOME}/.linux.zshrc
fi
