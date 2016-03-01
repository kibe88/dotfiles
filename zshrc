echo 'oi'
if [[ -r ~/.profile ]]; then
  source ~/.profile
fi

# start zgen
if [ -f ~/.zgen/zgen.zsh ] && ! zgen saved; then
    source ~/.zgen/zgen.zsh

    echo 'Creating zgen save'

    zgen prezto prompt theme 'sorin'
    zgen prezto
    zgen prezto git
    zgen prezto command-not-found
    zgen prezto syntax-highlighting

    zgen save
fi
