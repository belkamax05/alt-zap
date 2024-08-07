function azBuild() {
    pushd $AZ_DIR >/dev/null
    yarn cli:build
    popd >/dev/null
}
