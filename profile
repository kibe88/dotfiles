# Loads shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
for file in ~/.{path,exports,aliases,functions}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

if is_osx; then
    source ${HOME}/.osx
fi

# TMUX
if commandExists tmux; then
    # if no session is started, start a new session
    test -z ${TMUX} && tmux

    # when quitting tmux, try to attach
    while test -z ${TMUX}; do
        tmux attach || break
    done
fi
