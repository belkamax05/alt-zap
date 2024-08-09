function az-load-user() {
    if [ -f "$AZ_CONFIG_DIR/include.zsh" ]; then
        source "$AZ_CONFIG_DIR/include.zsh"
    else
        azError "User include file not found: $AZ_CONFIG_DIR/include.zsh"
    fi
}
