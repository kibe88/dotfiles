# ls more organized
alias ls='ls -GFhla'

# Enable virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PIP_RESPECT_VIRTUALENV=true
export PIP_VIRTUALENV_BASE=$WORKON_HOME

# Loads shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,exports,aliases,functions,extra}; do
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

  export VIRTUALENVWRAPPER_VIRTUALENV=$(brew --prefix)/bin/virtualenv
  export VIRTUALENVWRAPPER_PYTHON=$(brew --prefix)/bin/python
fi

if is_osx; then
    source ${HOME}/.osx
fi

# Explictly setting locale cause sometimes osx doesn't
export LC_ALL=en_US.UTF-8

# Enable git completion script
if [ -f ${HOME}/.bin/git_completion.sh ]; then
	source ${HOME}/.bin/git_completion.sh
else
    echo "WARNING: Can't find git_completion.sh"
fi

# RUBY PERFS
export RUBY_GC_HEAP_INIT_SLOTS=800000
export RUBY_HEAP_FREE_MIN=100000
export RUBY_HEAP_SLOTS_INCREMENT=300000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=79000000
export TERM='xterm-256color'

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
