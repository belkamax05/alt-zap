function stsFindScriptName() {
    local cmd="$1"
    local ext="${cmd##*.}"

    # local dirsToSearch=("$STS_DIR/command/system" "$STS_DIR/command" "$PWD")
    local dirsToSearch=("$STS_DIR/command/system" "$STS_DIR/command")
    if [[ $PWD != $STS_DIR* ]]; then
        dirsToSearch+=("$PWD")
    fi

    for dir in "${dirsToSearch[@]}"; do
        local scr=$(find "$dir" -maxdepth 2 -type f -path "*/$cmd.sh" -print -quit)
        if [ -z "$scr" ]; then
            scr=$(find "$dir" -maxdepth 2 -type f -path "*/$cmd.*" -print -quit)
        fi
        if [ -z "$scr" ]; then
            scr=$(find "$dir" -maxdepth 2 -type f -path "*/$cmd" -print -quit)
        fi
        if [ -n "$scr" ]; then
            echo "$scr"
            return
        fi
    done
}
