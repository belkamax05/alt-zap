function azBuild() {
    pushd $AZ_DIR >/dev/null
    yarn build
    popd >/dev/null
}
