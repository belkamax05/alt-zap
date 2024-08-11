function azIncludeModule() {
    local command="$1"
    local guardName="module_${command//-/_}"
    azGuardCheck "$guardName"
    if [ "$?" -eq 1 ]; then
        # azDebugFunction "azIncludeModule" "Module '${AZ_C_YELLOW}$command${AZ_C_RESET}' is already included"
        return 0
    fi
    if [[ -f "$AZ_DIR/system/modules/az-$command.zsh" ]]; then
        azSourceSystemModule "az-$command.zsh"
        azGuardSet "$guardName"
    fi
}

function azRunModule() {
    local command="$1"
    local guardName="module_${command//-/_}"
    azGuardCheck "$guardName"
    if [ "$?" -eq 1 ]; then
        az-$command "${@:2}"
        return 0
    fi
    azErrorFunction "azRunModule" "Runner for module '${AZ_C_YELLOW}$command${AZ_C_RESET}' was not found"
    return 1
}
