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
