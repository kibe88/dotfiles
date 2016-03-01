echo 'oi'
if [[ -r ~/.profile ]]; then
  source ~/.profile
fi

# start zgen
if [ -f ~/.zgen/zgen.zsh ]; then
    source ~/.zgen/zgen.zsh
    if ! zgen saved; then
        echo 'Creating zgen save'

        zgen prezto prompt theme 'sorin'
        zgen prezto
        zgen prezto git
        zgen prezto command-not-found
        zgen prezto syntax-highlighting

        zgen save
    fi
fi
