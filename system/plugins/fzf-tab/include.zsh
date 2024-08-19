if [ ! -d "$FZF_TAB_DIR" ]; then
    az install fzf-tab
fi
autoload -U compinit
compinit
source $FZF_TAB_DIR/fzf-tab.plugin.zsh
