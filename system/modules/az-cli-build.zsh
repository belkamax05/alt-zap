function az-cli-build() {
    pushd $AZ_DIR >/dev/null
    if az-is-debug; then
        yarn cli:build
    else
        yarn cli:build >/dev/null
    fi
    popd >/dev/null
}
