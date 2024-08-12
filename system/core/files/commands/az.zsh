# > az # Default view with no args
# > az cmd # Run command, example is "az error Message body", which translates to "az-error Message body"
function az() {
    if [ -z "$1" ]; then
        echo "!az! Default view TODO replace"
        return
    fi
    local command="$1"
    azGuardCheckCommand "$command"
    if [ $? -eq 1 ]; then
        azRunCommand "$@"
        return 0
    fi

    azFindCommand "$@"
    if [ $? -eq 0 ]; then
        return 0
    fi
    azError "[az.zsh] Module '${AZ_C_YELLOW}$1${AZ_C_RESET}'${2:+ (arguments ${AZ_C_YELLOW}${@:2}${AZ_C_RESET})} could not be loaded. Does not exist or error prevents loading."
    return 1
}
