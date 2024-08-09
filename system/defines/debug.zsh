export AZ_DEBUG=${AZ_DEBUG:-0}

function az-is-debug() {
    if [ "$AZ_DEBUG" -eq 1 ]; then
        return 0
    fi
    return 1
}
function az-no-debug() {
    if az-is-debug; then
        return 1
    else
        return 0
    fi
}
