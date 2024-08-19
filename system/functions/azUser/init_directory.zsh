function azUser-init_directory() {
    if [ ! -d "$AZ_CONFIG_DIR" ]; then
        mkdir -p "$AZ_CONFIG_DIR"
    fi
    if [ ! -d "$AZ_CONFIG_DIR/bin" ]; then
        mkdir -p "$AZ_CONFIG_DIR/bin"
    fi
    if [ ! -d "$AZ_PLUGINS_INSTALLED_DIR" ]; then
        mkdir -p "$AZ_PLUGINS_INSTALLED_DIR"
    fi
    if [ ! -f "$AZ_CONFIG_DIR/init.zsh" ]; then
        cp "$AZ_DEFAULTS_DIR/config/init.zsh" "$AZ_CONFIG_DIR/init.zsh"
    fi
    if [ ! -f "$AZ_CONFIG_DIR/start.zsh" ]; then
        cp "$AZ_DEFAULTS_DIR/config/start.zsh" "$AZ_CONFIG_DIR/start.zsh"
    fi
    if [ ! -f "$AZ_CONFIG_DIR/load.zsh" ]; then
        cp "$AZ_DEFAULTS_DIR/config/load.zsh" "$AZ_CONFIG_DIR/load.zsh"
    fi
}