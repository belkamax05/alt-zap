function az-cli-proxy-silent() {
    local scriptResult=$(az cli "$@")
    local lastOutputLine=$(echo "${scriptResult}" | tail -n 1)

    azDebug "lastOutputLine: ${lastOutputLine}"
    eval "${lastOutputLine}"
}
