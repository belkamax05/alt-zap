function az-cli() {
    if [ "$1" = "-b" ] || [ "$1" = "build" ]; then
        az cli-build
        if [ -n "$2" ]; then
            az cli "${@:2}"
        fi
        return 0
    fi
    # if [ "$1" = "-p" ] || [ "$1" = "proxy" ]; then
    #     # az cli-proxy "${@:2}"
    #     return 0
    # fi
    # if [ "$1" = "-ps" ] || [ "$1" = "proxy-silent" ]; then
    #     # az cli-proxy-silent "${@:2}"
    #     return 0
    # fi
    # node "$AZ_ROOT/dist/apps/cli/index.cjs" "$@"
    local scriptResult=$(FORCE_COLOR=1 node "$AZ_ROOT/dist/apps/cli/index.cjs" "$@" | tee /dev/tty)
    while IFS= read -r line; do
        if [[ "${line}" == "> "* ]]; then
            eval "${line:2}"
        fi
    done <<<"${scriptResult}"
    # local lastOutputLine=$(echo "${scriptResult}" | tail -n 1)
    # if [[ "${lastOutputLine}" == "> "* ]]; then
    #     eval "${lastOutputLine:2}"
    # fi
}

# function az-cli-proxy() {
#     local scriptResult=$(FORCE_COLOR=1 az cli "$@" | tee /dev/tty)
#     local lastOutputLine=$(echo "${scriptResult}" | tail -n 1)
#     azDebug "lastOutputLine: ${lastOutputLine}"
#     if [[ "${lastOutputLine}" == "> "* ]]; then
#         eval "${lastOutputLine:2}"
#     fi
# }
# function az-cli-proxy-silent() {
#     local scriptResult=$(az cli "$@")
#     local lastOutputLine=$(echo "${scriptResult}" | tail -n 1)
#     azDebug "lastOutputLine: ${lastOutputLine}"
#     eval "${lastOutputLine}"
# }
