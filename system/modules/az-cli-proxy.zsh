function az-cli-proxy() {
    local scriptResult=$(az cli "$@")
    eval "${scriptResult}"
}
