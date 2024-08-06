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
