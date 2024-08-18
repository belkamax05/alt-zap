function azDebug() {
    if azNoDebug; then
        return 0
    fi
    echo "$AZ_PREFFIX_DEBUG $@"
}

function azError() {
    echo "$AZ_PREFFIX_ERROR $@"
}

function azSuccess() {
    echo "$AZ_PREFFIX_SUCCESS $@"
}

function azInfo() {
    echo "$AZ_PREFFIX_INFO $@"
}

function azEcho() {
    echo "$AZ_PREFFIX_ECHO $@"
}
function azErrorFunction() {
    local name="$1"
    azError "${AZ_C_CYAN}[$name]${AZ_C_RESET} ${@:2}"
}
