function azGuardCheckFunction() {
    azGuardCheck "function_$1"
}
function azGuardSetFunction() {
    azGuardSet "function_$1"
}
function azLoadFunction() {
    local func="$1"
    # replace / with -
    local funcDashed="${func//\//-}"
    # alternative name, replace - with /
    local funcSlashed="${func//-//}"
    azGuardCheckFunction "$funcDashed"
    if [ $? -eq 1 ]; then
        return 0
    fi
    # searching for "-" version of function
    if [ -f "$AZ_FUNCTIONS_DIR/$funcDashed.zsh" ]; then
        azDebugFunction "azLoadFunction" "Initialising '${AZ_C_YELLOW}$funcDashed${AZ_C_RESET}' function"
        azSource "$AZ_FUNCTIONS_DIR/$funcDashed.zsh"
        azGuardSetFunction "$funcDashed"
        return 0
    fi
    # searching for "/" version of function
    if [ -f "$AZ_FUNCTIONS_DIR/$funcSlashed.zsh" ]; then
        azDebugFunction "azLoadFunction" "Initialising '${AZ_C_YELLOW}$funcSlashed${AZ_C_RESET}' function"
        azSource "$AZ_FUNCTIONS_DIR/$funcSlashed.zsh"
        azGuardSetFunction "$funcDashed"
        return 0
    fi
    azDebugFunction "azLoadFunction" "Function '${AZ_C_YELLOW}$func${AZ_C_RESET}' not found"
    return 1
}
function azRunFunction() {
    local func="$1"
    # replace / with -
    local funcDashed="${func//\//-}"
    azGuardCheckFunction "$funcDashed"
    if [ $? -eq 0 ]; then
        azLoadFunction "$func"
    fi
    azDebugFunction "azLoadFunction" "Run function '${AZ_C_YELLOW}$func${AZ_C_RESET}' with args ${AZ_C_YELLOW}${@:2}${AZ_C_RESET}"
    $funcDashed "${@:2}"
    return 0
}

alias azFunction=azRunFunction
alias azFunc=azRunFunction