#general fzf config
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_ADD_OPTS='--layout=reverse'
export FZF_DEFAULT_OPTS='--color=bg+:#3B4252,bg:#2E3440,spinner:#81A1C1,hl:#616E88,fg:#D8DEE9,header:#616E88,info:#81A1C1,pointer:#81A1C1,marker:#81A1C1,fg+:#D8DEE9,prompt:#81A1C1,hl+:#81A1C1'
export FZF_TMUX_OPTS="-p"
export FZF_CTRL_R_OPTS="$FZF_DEFAULT_ADD_OPTS"
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# enhancd
export ENHANCD_FILTER="$FZF_BIN_PATH"

# fzf z config (ctrl-g)
export FZFZ_EXTRA_OPTS="$FZF_DEFAULT_ADD_OPTS"
export FZF_BIN_PATH='fzf-tmux -p --layout=reverse'
