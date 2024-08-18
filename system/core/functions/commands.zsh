function azGuardCheckCommand() {
    azGuardCheck "command_$1"
}
function azGuardSetCommand() {
    azGuardSet "command_$1"
}
function azLoadCommand() {
    local command="$1"
    azGuardCheckCommand "$command"
    if [ $? -eq 1 ]; then
        return 0
    fi
    if [ -f "$AZ_COMMANDS_DIR/az-$command.zsh" ]; then
        azDebugFunction "azLoadCommand" "Initialising '${AZ_C_YELLOW}$command${AZ_C_RESET}' command"
        azSource "$AZ_COMMANDS_DIR/az-$command.zsh"
        azGuardSetCommand "$command"
        return 0
    fi
    azDebugFunction "azLoadCommand" "Command '${AZ_C_YELLOW}$command${AZ_C_RESET}' not found"
    return 1
}
function azRunCommand() {
    local command="$1"
    azGuardCheckCommand "$command"
    if [ $? -eq 0 ]; then
        azLoadCommand "$command"
    fi
    azDebugFunction "azRunCommand" "Run command '${AZ_C_YELLOW}$command${AZ_C_RESET}' with args ${AZ_C_YELLOW}${@:2}${AZ_C_RESET}"
    az-$command "${@:2}"
    return 0
}
