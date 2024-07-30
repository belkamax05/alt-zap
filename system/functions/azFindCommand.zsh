function azFindCommand() {
    azDebug "[azFindCommand] ${AZ_C_YELLOW}$@${AZ_C_RESET}"

    local command="$1"
    if [[ -f "$AZ_ROOT/system/modules/az-$command.zsh" ]]; then
        azIncludeModule "$command" "${@:2}"
        azRunModule "$command" "${@:2}"
        return 0
    fi

    #? System Scripts
    if [[ -f "$AZ_ROOT/system/scripts/$command" ]]; then
        azDebug "Include script $command"
        azInclude "system/scripts/$command"
        return 0
    fi
    if [[ -f "$AZ_ROOT/system/scripts/$command.zsh" ]]; then
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

    return 1
}