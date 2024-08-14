function az-eval() {
    local command=$1
    azDebug "exec: $command"
    node -e $command
}
