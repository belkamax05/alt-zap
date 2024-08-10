function az-cli-build() {
    pushd $AZ_DIR >/dev/null
    if azIsDebug; then
        yarn cli:build
    else
        yarn cli:build >/dev/null
    fi
    popd >/dev/null
}
