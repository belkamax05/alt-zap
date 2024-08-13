function azRunCommand() {
    local command="$1"
    azGuardCheckCommand "$command"
    if [ $? -eq 0 ]; then
        azLoadCommand "$command"
    fi
    az-$command "${@:2}"
    return 0
}
