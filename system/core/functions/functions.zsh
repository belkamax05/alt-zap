function azGuardCheckFunction() {
    azGuardCheck "function_$1"
}
function azGuardSetFunction() {
    azGuardSet "function_$1"
}
# azGenerateFunctionVariations() {
#     echo "X1"
#     local funcNameOrig="$1"
#     local funcName="${funcNameOrig//\//-}"
#     local variations=()
#     local length=${#funcName}
#     echo "X2"
#     for ((i=1; i<=length; i++)); do
#         char=$(expr substr "$funcName" $i 1)
#         if [[ "$char" == "-" || "$char" == "/" ]]; then
#             echo "X5 char: $char, variations: $variations"
#             variations+=("${funcName:0:i-1}-${funcName:i}")
#             variations+=("${funcName:0:i-1}/${funcName:i}")
#             echo "X6 char: $char, variations: $variations"
#         fi
#     done
    
#     echo "${variations[@]}"
# }

function azLoadFunction() {
    local func="$1"
    # replace / with -
    local funcDashed="${func//\//-}"
    # alternative name, replace - with /
    local funcSlashed="${func//-//}"
    azTraceFunction azLoadFunction "$func, dashed: ${AZ_C_YELLOW}$funcDashed${AZ_C_RESET}, slashed: ${AZ_C_YELLOW}$funcSlashed${AZ_C_RESET}"
    azGuardCheckFunction $funcDashed
    if [ $? -eq 1 ]; then
        return 0
    fi
    # echo "A"
    # variations=$(azGenerateFunctionVariations "$funcDashed")
    # echo "B $variations"
    # for variation in $variations; do
    #     echo "C $variation"
    #     if [ -f "$AZ_FUNCTIONS_DIR/$variation.zsh" ]; then
    #         echo "D"
    #         azDebugFunction azLoadFunction "Initialising '${AZ_C_YELLOW}$variation${AZ_C_RESET}' function"
    #         azSource "$AZ_FUNCTIONS_DIR/$variation.zsh"
    #         azGuardSetFunction $funcDashed
    #         return 0
    #     fi
    # done
    # searching for "-" version of function
    if [ -f "$AZ_FUNCTIONS_DIR/$funcDashed.zsh" ]; then
        azDebugFunction azLoadFunction "Initialising '${AZ_C_YELLOW}$funcDashed${AZ_C_RESET}' function"
        azSource "$AZ_FUNCTIONS_DIR/$funcDashed.zsh"
        azGuardSetFunction $funcDashed
        return 0
    fi
    # searching for "/" version of function
    if [ -f "$AZ_FUNCTIONS_DIR/$funcSlashed.zsh" ]; then
        azDebugFunction azLoadFunction "Initialising '${AZ_C_YELLOW}$funcSlashed${AZ_C_RESET}' function"
        azSource "$AZ_FUNCTIONS_DIR/$funcSlashed.zsh"
        azGuardSetFunction $funcDashed
        return 0
    fi
    azDebugFunction azLoadFunction "Function '${AZ_C_YELLOW}$func${AZ_C_RESET}' not found at ${AZ_C_YELLOW}$AZ_FUNCTIONS_DIR${AZ_C_RESET}"
    return 1
}
function azRunFunction() {
    local func="$1"
    # replace / with -
    local funcDashed="${func//\//-}"
    azTraceFunction azRunFunction "${AZ_C_YELLOW}$func${AZ_C_RESET}, dashed: ${AZ_C_YELLOW}$funcDashed${AZ_C_RESET}"
    azGuardCheckFunction $funcDashed
    if [ $? -eq 0 ]; then
        azLoadFunction $func
    fi
    azDebugFunction azRunFunction "Run function '${AZ_C_YELLOW}$func${AZ_C_RESET}' with args ${AZ_C_YELLOW}${@:2}${AZ_C_RESET}"
    $funcDashed "${@:2}"
    return 0
}

alias azFunction=azRunFunction
alias azFunc=azRunFunction