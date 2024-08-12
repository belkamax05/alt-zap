function azIsDebug() {
    if [ "$AZ_DEBUG" = "true" ]; then
        return 0
    fi
    return 1
}

function azNoDebug() {
    if azIsDebug; then
        return 1
    else
        return 0
    fi
}

alias azIsNotDebug='azNoDebug'

function azDebugSource() {
    azDebug "${AZ_C_CYAN}[Source]${AZ_C_RESET} $@"
}

function azDebugFunction() {
    local name="$1"
    # if [ "$name" = "azRunCommand" ]; then
    #     return 0
    # elif [ "$name" = "azFindCommand" ]; then
    #     return 0
    # fi
    azDebug "${AZ_C_CYAN}[$name]${AZ_C_RESET} ${@:2}"
}
