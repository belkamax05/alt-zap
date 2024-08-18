function azTrace() {
    if [ "$AZ_TRACE" -ne 1 ]; then
        return
    fi
    echo "\033[38;5;57m[TRACE]\033[0m $@"
}
function azTraceFunction() {
    local name="$1"
    azTrace "${AZ_C_CYAN}[$name]${AZ_C_RESET} ${@:2}"
}
function azTraceGuard() {
    azTraceFunction Guard "$@"
}
function azTraceSource() {
    azTraceFunction Source "$@"
}

# function azTraceGuard() {
#     azTrace "${AZ_C_CYAN}[Guard]${AZ_C_RESET} $@"
# }
# function azTraceSource() {
#     azTrace "${AZ_C_CYAN}[Source]${AZ_C_RESET} $@"
# }