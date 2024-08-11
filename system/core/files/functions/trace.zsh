function azTraceGuard() {
    azTrace "${AZ_C_CYAN}[Guard]${AZ_C_RESET} $@"
}
function azTraceSource() {
    azTrace "${AZ_C_CYAN}[Source]${AZ_C_RESET} $@"
}
function azTraceFunction() {
    local name="$1"
    azTrace "${AZ_C_CYAN}[$name]${AZ_C_RESET} $@"
}
