function az-cli() {
    if [ "$1" = "-b" ]; then
        echo "B"
        az cli-build
        az cli "${@:2}"
        return 0
    fi
    node "$AZ_ROOT/dist/apps/cli/index.cjs" "$@"
}
