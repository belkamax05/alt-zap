function azRunFile() {
    azDebug "azRunFile ${AZ_C_YELLOW}$@${AZ_C_RESET}"

    local filePath="$1"

    if [ -f "$filePath" ]; then
        azDebug "Include shell script $filePath"
        source "$filePath"
        return 0
    fi

    return 1
}
