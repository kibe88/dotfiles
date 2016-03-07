[ -r ~/.functions ] && [ -f ~/.functions ] && source ~/.functions

for file in ~/.{exports,aliases}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

if is_osx; then
    source ${HOME}/.osx
fi

# start zgen
if [ -f ~/.zgen/zgen.zsh ]; then

    # as zgen may need some user defined bin we source it before zgen
    [ -r ~/.path ] && [ -f ~/.path ] && source ~/.path

    source ~/.zgen/zgen.zsh

    if ! zgen saved; then
        echo 'Creating zgen save'

        zgen prezto prompt theme 'sorin'
        zgen prezto
        zgen prezto tmux
        zgen prezto git
        zgen prezto command-not-found
        zgen prezto syntax-highlighting
        zgen prezto homebrew
        zgen prezto osx
        zgen prezto archive
        zgen prezto environment
        zgen prezto ruby
        zgen prezto python
        zgen prezto node
		zgen prezto utility
        zgen prezto history
        zgen prezto history-substring-search

        zgen save
    fi
fi

export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
