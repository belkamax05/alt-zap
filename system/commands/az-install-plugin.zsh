function az-install-plugin() {
    local pluginName=$1
    local pluginPath=$AZ_PLUGINS_DIR/$pluginName/install.zsh
    if [ -f $pluginPath ]; then
        source $pluginPath
        return 0
    fi

    azError "Error: plugin '${AZ_C_YELLOW}$pluginName${AZ_C_RESET}' not found at ${AZ_C_YELLOW}$pluginPath${AZ_C_RESET}"
}
