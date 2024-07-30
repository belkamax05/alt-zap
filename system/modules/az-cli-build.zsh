function az-cli-build() {
    pushd $AZ_ROOT >/dev/null
    yarn build
    popd >/dev/null
}
