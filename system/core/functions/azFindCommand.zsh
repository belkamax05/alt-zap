function azFindCommand() {
    azDebug "azFindCommand ${AZ_C_YELLOW}$@${AZ_C_RESET}"

    local command="$1"
    AZ_INCLUDE_GUARD="INCLUDED_${command//-/_}_ZSH"

    print -v AZ_GUARD_VALUE -- "${(P)AZ_INCLUDE_GUARD}" #? Comment temprorary to autoformat file

    #? System Modules
    if [[ -f "$AZ_ROOT/system/modules/az-$command.zsh" && -z "$AZ_GUARD_VALUE" ]]; then
        azDebug "Include module az-$command.zsh for the first time"
        azInclude "system/modules/az-$command.zsh"
        eval "$AZ_INCLUDE_GUARD=1"
    fi

    print -v AZ_GUARD_VALUE -- "${(P)AZ_INCLUDE_GUARD}" #? Comment temprorary to autoformat file

    if [ "$AZ_GUARD_VALUE" = "1" ]; then
        az-$command "${@:2}"
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
