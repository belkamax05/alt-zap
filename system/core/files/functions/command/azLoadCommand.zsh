function azLoadCommand() {
    local command="$1"
    azGuardCheckCommand "$command"
    if [ $? -eq 1 ]; then
        return 0
    fi
    if [ -f "$AZ_SYSTEM_COMMANDS_DIR/az-$command.zsh" ]; then
        azDebugFunction "azLoadCommand" "Initialising '${AZ_C_YELLOW}$command${AZ_C_RESET}' comand"
        azSource "$AZ_SYSTEM_COMMANDS_DIR/az-$command.zsh"
        azGuardSetCommand "$command"
        return 0
    fi
    azDebugFunction "azLoadCommand" "Command '${AZ_C_YELLOW}$command${AZ_C_RESET}' not found"
    return 1
}
