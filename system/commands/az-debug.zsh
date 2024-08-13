function az-debug() {
    local command="$1"
    if [ -z "$command" ]; then
        azError "${AZ_C_CYAN}[az debug]${AZ_C_RESET} Command is empty"
        return 1
    fi
    if [ "$command" = "on" ] || [ "$command" = "enable" ]; then
        az cli config/set debug true
        azLoadUserConfig
        azDebug "!!! Debug mode is activated"
        return 0
    fi
    if [ "$command" = "off" ] || [ "$command" = "disable" ]; then
        az cli config/set debug false
        azLoadUserConfig
        azDebug "!!! Debug mode is deactivated"
        return 0
    fi
    azError "${AZ_C_CYAN}[az debug]${AZ_C_RESET} Unknown command: ${AZ_C_YELLOW}$command${AZ_C_RESET}"
    return 1
}
