function azIncludeModule() {
    azDebug "[azIncludeModule] args: $@"

    local command="$1"
    AZ_INCLUDE_GUARD="INCLUDED_${command//-/_}_ZSH"
    print -v AZ_GUARD_VALUE -- "${(P)AZ_INCLUDE_GUARD}" #? Comment temprorary to autoformat file
    #? System Modules
    if [[ -f "$AZ_DIR/system/modules/az-$command.zsh" && -z "$AZ_GUARD_VALUE" ]]; then
        azDebug "[azIncludeModule] Initialize '${AZ_C_YELLOW}$command${AZ_C_RESET}' module"
        azInclude "system/modules/az-$command.zsh"
        eval "$AZ_INCLUDE_GUARD=1"
    fi
}
