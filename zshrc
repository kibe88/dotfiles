[ -r ~/.functions ] && [ -f ~/.functions ] && source ~/.functions

for file in ~/.{exports,path,aliases}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

export ZGEN_RESET_ON_CHANGE=($HOME/dotfiles/zshrc $HOME/.zshrc)
# start zgen
if [ -f ~/.zgen/zgen.zsh ]; then

    source ~/.zgen/zgen.zsh

    if ! zgen saved; then
        echo 'Creating zgen save'

        zgen prezto prompt theme 'sorin'
        zgen prezto
        zgen prezto tmux
        zgen prezto git
        zgen prezto command-not-found
        zgen prezto syntax-highlighting
        zgen prezto utility
        zgen prezto completion
        zgen prezto directory
        zgen prezto homebrew
        zgen prezto osx
        zgen prezto archive
        zgen prezto environment
        zgen prezto ruby
        zgen prezto python
        zgen prezto node
        zgen prezto history
        zgen prezto history-substring-search

        zgen load zsh-users/zsh-completions src
        zgen load jreese/zsh-titles
        if is_osx; then
          zgen load ${HOME}/.osx
        fi

        zgen load /usr/local/opt/fzf/shell/key-bindings.zsh
        zgen load /usr/local/opt/fzf/shell/completion.zsh
        zgen load ${HOME}/dotfiles/shell-extensions/fzf

        zgen save
    fi

    # Somehow fzf keybindings arent mapped after first restart, it only works if
    # the file is sourced again (reloading til i fix it cleanly)
    source ~/.zgen/zgen.zsh
fi

export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
