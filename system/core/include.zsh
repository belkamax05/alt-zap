function azTrace() {
    # echo "--- [az.TRACE] --- $@"
}
function azCoreSource() {
    local file="$AZ_DIR/system/core/$1"
    azTrace "Sourcing $file"
    source "$file"
}
azCoreSource "files/initial/paths.zsh"
azCoreSource "run-with-build.zsh"
