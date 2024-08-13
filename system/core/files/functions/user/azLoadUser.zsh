# function azLoadUserConfig() {
#     if [ -f "$AZ_CONFIG_DIR/user-config.zsh" ]; then
#         source "$AZ_CONFIG_DIR/user-config.zsh"
#     else
#         azError "User config not found: $AZ_CONFIG_DIR/user-config.zsh"
#     fi
# }

function azLoadUser() {
    if [ ! -f "$AZ_CONFIG_DIR/include.zsh" ]; then
        touch "$AZ_CONFIG_DIR/include.zsh"
    fi
    source "$AZ_CONFIG_DIR/include.zsh"
}
