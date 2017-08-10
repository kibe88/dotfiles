if ! command -v brew > /dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew tap Homebrew/bundle
#brew bundle ~/dotfiles/Brewfile
mkdir -p ${HOME}/.vim/tmp/backup
mkdir -p ${HOME}/.vim/tmp/swap

rcup -d ${HOME}/dotfiles
