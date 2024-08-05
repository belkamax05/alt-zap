function az-cli-proxy() {
    local scriptResult=$(FORCE_COLOR=1 az cli "$@" | tee /dev/tty)
    local lastOutputLine=$(echo "${scriptResult}" | tail -n 1)

    azDebug "lastOutputLine: ${lastOutputLine}"
    # eval "${lastOutputLine}"
    if [[ "${lastOutputLine}" == "> "* ]]; then
        eval "${lastOutputLine:2}"
    fi
}
