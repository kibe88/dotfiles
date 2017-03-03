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

for file in ~/.{path,exports,aliases}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


if is_osx; then
    source ${HOME}/.osx
fi

# Make sure extglob is enabled:
shopt -s extglob

if commandExists brew; then
  # Enable bash completion
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
  else
      echo "WARNING: Can't find bash_completion.sh"
  fi
fi

# shell prompt customization
if [ -f ${HOME}/.bash_themes/k ]; then
    source ~/.bash_themes/k
fi

# Enable django completion
if [ -f ${HOME}/.bin/django_bash_completion.sh ]; then
    . ${HOME}/.bin/django_bash_completion.sh
else
    echo "WARNING: Can't find django_bash_completion.sh"
fi

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
   if [ -f /usr/share/bash-completion/bash_completion ]; then
      . /usr/share/bash-completion/bash_completion
   elif [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
   fi
fi

extract() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
            *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
                   c=(bsdtar xvf);;
            *.7z)  c=(7z x);;
            *.Z)   c=(uncompress);;
            *.bz2) c=(bunzip2);;
            *.exe) c=(cabextract);;
            *.gz)  c=(gunzip);;
            *.rar) c=(unrar x);;
            *.xz)  c=(unxz);;
            *.zip) c=(unzip);;
            *)     echo "$0: unrecognized file extension: \`$i'" >&2
                   continue;;
        esac

        command "${c[@]}" "$i"
        ((e = e || $?))
    done
    return "$e"
}

# Enable git completion script
if [ -f ${HOME}/.bin/git_completion.sh ]; then
    source ${HOME}/.bin/git_completion.sh
else
    echo "WARNING: Can't find git_completion.sh"
fi

# Load lunchy completion (osx launchctl wrapper for easier daemon handling)
if is_osx; then
  LUNCHY_COMPLETION=$(dirname `gem which lunchy`)/../extras/lunchy-completion.bash
  if [ -f $LUNCHY_COMPLETION ]; then
    . $LUNCHY_COMPLETION
  fi
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
