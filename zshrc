# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ${HOME}/.functions
source ${HOME}/.exports
source ${HOME}/.path

source ${HOME}/.defaults
source ${HOME}/.aliases

if is_osx; then
  source ${HOME}/.osx
fi

if is_linux; then
  source ${HOME}/.linux.zshrc
fi

# source ${HOME}/.zshrc.zplug
source ${HOME}/.zshrc.zgenom
