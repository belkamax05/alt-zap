function az-calc() {
    local value=$1
    local command="const result=$value;console.log(result);"
    azDebug "command: $command"
    node -e $command
}
