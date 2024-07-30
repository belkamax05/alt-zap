function az-cli-proxy() {
    local scriptResult=$(az cli "$@" | tee /dev/tty)
    local lastOutputLine=$(echo "${scriptResult}" | tail -n 1)

    azDebug "lastOutputLine: ${lastOutputLine}"
    eval "${lastOutputLine}"
}
