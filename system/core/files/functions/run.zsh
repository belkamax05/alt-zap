function azRunFile() {
    azDebug "[azRunFile] ${AZ_C_YELLOW}$@${AZ_C_RESET}"

    local filePath="$1"
    local fileExtension="${filePath##*.}"

    if [ -f "$filePath" ]; then
        if [ "$fileExtension" = "sh" ]; then
            azDebug "Include shell script $filePath"
            source "$filePath"
            return 0
        elif [ "$fileExtension" = "zsh" ]; then
            azDebug "Include shell script $filePath"
            source "$filePath"
            return 0
        elif [ "$fileExtension" = "js" ]; then
            azDebug "Include shell script $filePath"
            node "$filePath"
            return 0
        elif [ "$fileExtension" = "ts" ]; then
            azDebug "Include shell script $filePath"
            "$AZ_DIR/node_modules/.bin/ts-node" "$filePath"
            return 0
        fi
    fi

    azError "[azRunFile] Runner for file $filePath was not found"
    return 1
}

# function azFindCommand() {
#     azDebugFunction "azFindCommand" "${AZ_C_YELLOW}$@${AZ_C_RESET}"
#     local command="$1"
#     if [[ -f "$AZ_SYSTEM_COMMANDS_DIR/az-$command.zsh" ]]; then
#         azRunCommand "$command" "${@:2}"
#         return 0
#     fi

#     #? Path files
#     # local filePath="$PWD/$command"
#     # if [ -f "$filePath" ]; then
#     #     azDebug "Include file $filePath"
#     #     azRunFile "$filePath" "${@:2}"
#     #     return 0
#     # fi

#     #? Script in js
#     # if [[ -f "$AZ_DIR/apps/cli/src/commands/$command.ts" ]]; then
#     # azDebug "Include script $command.ts"
#     # az cli "$@"
#     # return 0
#     # fi
#     # az clix "$@"
#     # if [ $? -eq 0 ]; then
#     #     echo "Command found A: $command"
#     #     return 0
#     # fi
#     # echo "Command not found B: $command"

#     az cli "$@"
#     return 0
# }
