function azFindCommand() {
    azDebug "${AZ_C_CYAN}[azFindCommand]${AZ_C_RESET} ${AZ_C_YELLOW}$@${AZ_C_RESET}"

    local command="$1"
    if [[ -f "$AZ_DIR/system/modules/az-$command.zsh" ]]; then
        azIncludeModule "$command" "${@:2}"
        azRunModule "$command" "${@:2}"
        return 0
    fi

    #? System Scripts
    if [[ -f "$AZ_DIR/system/scripts/$command" ]]; then
        azDebug "Include script $command"
        azInclude "system/scripts/$command"
        return 0
    fi
    if [[ -f "$AZ_DIR/system/scripts/$command.zsh" ]]; then
        azDebug "Include script $command.zsh"
        azInclude "system/scripts/$command.zsh"
        return 0
    fi

    #? Path files
    local filePath="$PWD/$command"
    if [ -f "$filePath" ]; then
        azDebug "Include file $filePath"
        azRunFile "$filePath" "${@:2}"
        return 0
    fi

    #? Script in js
    # if [[ -f "$AZ_DIR/apps/cli/src/commands/$command.ts" ]]; then
    # azDebug "Include script $command.ts"
    # az cli "$@"
    # return 0
    # fi
    # az clix "$@"
    # if [ $? -eq 0 ]; then
    #     echo "Command found A: $command"
    #     return 0
    # fi
    # echo "Command not found B: $command"

    az cli "$@"
    return 0
}
