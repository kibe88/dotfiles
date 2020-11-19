export FZF_TMUX=1
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_ADD_OPTS='--reverse'
export FZF_TMUX_HEIGHT='40%'
export FZF_BIN_PATH='fzf-tmux'
export FZF_CTRL_R_OPTS="$FZF_DEFAULT_ADD_OPTS"
export FZFZ_EXTRA_OPTS="$FZF_DEFAULT_ADD_OPTS"
export ENHANCD_FILTER=fzf-tmux
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
