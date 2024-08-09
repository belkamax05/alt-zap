function stsCompile() {
    sts-echo "Compiling..."
    pushd $STS_DIR >/dev/null
    rm -rf "$STS_DIR/shell-ts"
    go build -o "$STS_DIR/bin/sts-go"
    if [ $? -eq 0 ]; then
        sts-echo "Compiled successfully"
    else
        sts-echo "Failed to compile"
    fi
    popd >/dev/null
}
