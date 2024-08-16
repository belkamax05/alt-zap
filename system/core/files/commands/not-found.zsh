function az-not-found() {
    local command="$1"
    azDebugFunction "az-not-found" "Not found '${AZ_C_YELLOW}$command${AZ_C_RESET}'"
    # azDebugFunction "az-not-found" "Execute ${AZ_C_YELLOW}$@${AZ_C_RESET}"
    # echo "This is default command not found with params $@"

    if [ -f "$AZ_SYSTEM_COMMANDS_DIR/az-$command.zsh" ]; then
        azDebugFunction "az-not-found" "Run command '${AZ_C_YELLOW}$command${AZ_C_RESET}'"
        azRunCommand "$command" "${@:2}"
        return 0
    fi

    local filePath="$PWD/$command"
    if [ -f "$filePath" ]; then
        azDebugFunction "az-not-found" "Include run file $filePath"
        azRunFile "$filePath" "${@:2}"
        return 0
    fi

    azDebugFunction "az-not-found" "Redirect ${AZ_C_CYAN}not-found${AZ_C_RESET} '${AZ_C_YELLOW}$1${AZ_C_RESET}' into az-cli ${AZ_C_YELLOW}${@:2}${AZ_C_RESET}"
    az-cli "$@"
    return 0
}
azGuardSetCommand "not-found"
