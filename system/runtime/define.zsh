
export AZ_RUNTIME_DIR=$(dirname "${(%):-%N}")

function azTrace() {
    # echo "\033[38;5;57m[TRACE]\033[0m $@"
}
function azRuntimeSource() {
    local file="$AZ_RUNTIME_DIR/$1"
    azTrace "Sourcing $file"
    source "$file"
}
function azCoreSource() {
    local file="$AZ_DIR/system/core/$1"
    azTrace "Sourcing $file"
    source "$file"
}
function azConfigSource() {
    local file="$AZ_CONFIG_DIR/$1"
    azTrace "Sourcing $file"
    if [ ! -f "$file" ]; then
        touch "$file"
    fi
    source "$file"
}