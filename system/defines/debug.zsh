export AZ_DEBUG=1

function az-is-debug() {
    if [ "$AZ_DEBUG" -eq 1 ]; then
        return 0
    fi
    return 1
}
