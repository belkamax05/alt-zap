#? zap manager - https://github.com/zap-zsh/zap

if [ ! -d "$ZAP_DIR" ]; then
    az install zap
fi
source $ZAP_DIR/zap.zsh
