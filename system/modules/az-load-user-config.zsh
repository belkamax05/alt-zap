function az-load-user-config() {
    if [ -f "$AZ_CONFIG_DIR/user-config.zsh" ]; then
        source "$AZ_CONFIG_DIR/user-config.zsh"
    else
        azError "User config not found: $AZ_CONFIG_DIR/user-config.zsh"
    fi
}
