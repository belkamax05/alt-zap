function az-cli() {
    if [ "$1" = "-b" ] || [ "$1" = "build" ]; then
        az cli-build
        if [ -n "$2" ]; then
            az cli "${@:2}"
        fi
        return 0
    fi
    if [ "$1" = "-p" ] || [ "$1" = "proxy" ]; then
        az cli-proxy "${@:2}"
        return 0
    fi
    node "$AZ_ROOT/dist/apps/cli/index.cjs" "$@"
}
