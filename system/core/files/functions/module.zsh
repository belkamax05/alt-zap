function azIncludeModule() {
    local command="$1"
    AZ_INCLUDE_GUARD="INCLUDED_${command//-/_}_ZSH"
    print -v AZ_GUARD_VALUE -- "${(P)AZ_INCLUDE_GUARD}" #? Comment temprorary to autoformat file
    #? System Modules
    if [[ -f "$AZ_DIR/system/modules/az-$command.zsh" && -z "$AZ_GUARD_VALUE" ]]; then
        azDebug "${AZ_C_CYAN}[azIncludeModule]${AZ_C_RESET} Initialize '${AZ_C_YELLOW}$command${AZ_C_RESET}' module"
        azSource "system/modules/az-$command.zsh"
        eval "$AZ_INCLUDE_GUARD=1"
    fi
}

function azRunModule() {
    print -v AZ_GUARD_VALUE -- "${(P)AZ_INCLUDE_GUARD}" #? Comment temprorary to autoformat file
    if [ "$AZ_GUARD_VALUE" = "1" ]; then
        azDebugFunction "azRunModule" "Run '${AZ_C_YELLOW}$command${AZ_C_RESET}' module"
        az-$command "${@:2}"
        return 0
    fi

    azError "[azRunModule] Runner for module '${AZ_C_YELLOW}$command${AZ_C_RESET}' was not found"
    return 1
}
