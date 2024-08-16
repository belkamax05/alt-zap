function command_not_found_handler {
    # azFindCommand "$@"
    # if [ $? -eq 0 ]; then
    #     return 0
    # fi
    # azError "[command_not_found_handler.zsh] Command '${AZ_C_YELLOW}$1${AZ_C_RESET}'${2:+ (arguments ${AZ_C_YELLOW}${@:2}${AZ_C_RESET})} not found. Did you mean to run a different command?"
    # return 127

    local command="$1"
    azDebugFunction "command_not_found_handler" "Not found '${AZ_C_YELLOW}$command${AZ_C_RESET}'"
    if [ -f "$AZ_SYSTEM_PLUGINS_DIR/$command/install.zsh" ]; then
        azDebugFunction "command_not_found_handler" " Installing '${AZ_C_YELLOW}$command${AZ_C_RESET}'"
        az install-plugin $command
        "$@"
        return 0
    fi

    az "$@"
    return 0
}
