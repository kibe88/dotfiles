# ls more organized
alias ls='ls -GFhla'

# Enable virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PIP_RESPECT_VIRTUALENV=true
export PIP_VIRTUALENV_BASE=$WORKON_HOME

# Make sure extglob is enabled:
shopt -s extglob

# Loads shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

if commandExists brew; then
  export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"

  if [[ -r $(brew --prefix)/bin/virtualenvwrapper.sh ]]; then
      source $(brew --prefix)/bin/virtualenvwrapper.sh
  else
      echo "WARNING: Can't find virtualenvwrapper.sh"
  fi

  # Enable bash completion
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
  else
      echo "WARNING: Can't find bash_completion.sh"
  fi

  export VIRTUALENVWRAPPER_VIRTUALENV=$(brew --prefix)/bin/virtualenv
  export VIRTUALENVWRAPPER_PYTHON=$(brew --prefix)/bin/python
fi

# shell prompt customization
source ~/.bash_themes/k

# Explictly setting locale cause sometimes osx doesn't
export LC_ALL=en_US.UTF-8

# Enable git completion script
if [ -f ${HOME}/bin/git_completion.sh ]; then
	source ${HOME}/.bin/git_completion.sh
else
    echo "WARNING: Can't find git_completion.sh"
fi

# Enable django completion
if [ -f ${HOME}/.bin/django_bash_completion.sh ]; then
    . ${HOME}/bin/django_bash_completion.sh
else
    echo "WARNING: Can't find django_bash_completion.sh"
fi

# Ignore case when using auto completion
set completion-ignore-case On

# This makes it unnecessary to press Tab twice when there is more than one match
set show-all-if-ambiguous On

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

# RUBY PERFS
export RUBY_GC_HEAP_INIT_SLOTS=800000
export RUBY_HEAP_FREE_MIN=100000
export RUBY_HEAP_SLOTS_INCREMENT=300000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=79000000
export TERM='xterm-256color'


# enable programmable completion features (you don't need to enable
# # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# # sources /etc/bash.bashrc).
if ! shopt -oq posix; then
   if [ -f /usr/share/bash-completion/bash_completion ]; then
      . /usr/share/bash-completion/bash_completion
   elif [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
   fi
fi

export PATH="$HOME/.rbenv/bin:$PATH"
if commandExists rbenv; then
  eval "$(rbenv init -)"
  export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
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

LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
if [ -f $LUNCHY_DIR/lunchy-completion.bash ]; then
    . $LUNCHY_DIR/lunchy-completion.bash
fi
