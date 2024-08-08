function az-debug() {
    if [ "$AZ_DEBUG" -eq 0 ]; then
        return 0
    fi
    echo "$AZ_PREFFIX_DEBUG $@"
}
