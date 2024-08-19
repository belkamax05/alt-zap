if [ ! -d "$ZAP_DIR" ]; then
    az install zap
fi
source $ZAP_DIR/zap.zsh

# [ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
