function az-not-found() {
    # azDebugFunction "az-not-found" "Execute ${AZ_C_YELLOW}$@${AZ_C_RESET}"
    # echo "This is default command not found with params $@"

    local command="$1"

    if [ -f "$AZ_SYSTEM_COMMANDS_DIR/az-$command.zsh" ]; then
        azRunCommand "$command" "${@:2}"
        return 0
    fi

    local filePath="$PWD/$command"
    if [ -f "$filePath" ]; then
        azDebugFunction "az-not-found" "Include run file $filePath"
        azRunFile "$filePath" "${@:2}"
        return 0
    fi

    azDebugFunction "az-not-found" "Cli ${AZ_C_YELLOW}$@${AZ_C_RESET}"
    az-cli "$@"
    return 0
}
azGuardSetCommand "not-found"
