function az-cli() {
    if [ "$1" = "-b" ] || [ "$1" = "--build" ] || [ "$1" = "build" ]; then
        az build
        if [ -n "$2" ]; then
            az cli "${@:2}"
        fi
        return 0
    fi

    # Prevents command execution (> "command").
    if [ "$1" = "-n" ] || [ "$1" = "--no-run" ]; then
        az-cli "${@:2}" >/dev/null
        return 0
    fi

    # Run the node script and capture its output and exit code
    # local scriptResult=$(FORCE_COLOR=1 node "$AZ_DIR/dist/apps/cli/index.cjs" "$@" | tee /dev/tty)
    local scriptResult=$(FORCE_COLOR=1 "$AZ_DIR/bin/run" "$@" | tee /dev/tty)
    local scriptCode=$?
    while IFS= read -r line; do
        if [[ "${line}" == "> "* ]]; then
            echo "Executing: ${line:2}. TODO (not to use this feature)"
            # eval "${line:2}"
        fi
    done <<<"${scriptResult}"

    # Print the captured exit code
    # echo "Process exit code: ${scriptCode}"

    # Return the captured exit code
    return ${scriptCode}
}
azGuardSetCommand "cli"
