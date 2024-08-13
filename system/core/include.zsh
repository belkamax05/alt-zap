function azTrace() {
    # echo "\033[38;5;57m[TRACE]\033[0m $@"
}
function azCoreSource() {
    local file="$AZ_DIR/system/core/$1"
    azTrace "Sourcing $file"
    source "$file"
}
azCoreSource "files/static/paths.zsh"
azCoreSource "run-with-build.zsh"
