function stsRunScriptFile() {
    local cmd="$1"
    local ext="${cmd##*.}"

    local fileName=$(basename "$cmd" ."$ext")

    # sts-debug "Run script $fileName at $cmd"

    if [ ! -f "$cmd" ]; then
        return 1
    fi

    case "$ext" in
    "sh")
        source "$@"
        ;;
    "js")
        node "$@"
        ;;
    "ts")
        ts-node "$@"
        ;;
    "cs")
        dotnet script "$@"
        ;;
    "rs")
        echo "Running with $fileName"
        mkdir -p $STS_DIR/temp/rustc
        rustc "$@" -o "$STS_DIR/temp/rustc/$fileName"
        $STS_DIR/temp/rustc/$fileName
        ;;
    *)
        # echo "No file found with .sh, .js, .ts, or .cs extension"
        return 1
        ;;
    esac
}
