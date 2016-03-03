[ -r ~/.functions ] && [ -f ~/.functions ] && source ~/.functions

# TMUX
if commandExists tmux; then
    # if no session is started, start a new session
    test -z ${TMUX} && tmux

    # when quitting tmux, try to attach
    while test -z ${TMUX}; do
        tmux attach || break
    done
fi

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
        zgen prezto git
        zgen prezto command-not-found
        zgen prezto syntax-highlighting

        zgen save
    fi
fi

if [ -f ~/.profile ]; then
  source ~/.profile
fi