function command_not_found_handler {
    # azFindCommand "$@"
    # if [ $? -eq 0 ]; then
    #     return 0
    # fi
    # azError "[command_not_found_handler.zsh] Command '${AZ_C_YELLOW}$1${AZ_C_RESET}'${2:+ (arguments ${AZ_C_YELLOW}${@:2}${AZ_C_RESET})} not found. Did you mean to run a different command?"
    # return 127
    az "$@"
    return 0
}
