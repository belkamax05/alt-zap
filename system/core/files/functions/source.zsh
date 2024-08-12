function azSource() {
    local file="$1"
    azTraceSource "$file"
    source "$file"
}
function azSourceOnce() {
    local file="$1"
    local hash=$(echo -n "$file" | shasum -a 256 | awk '{print $1}')
    local guardName="source_once_${hash}"
    azGuardCheck "$guardName"
    if [ $? -eq 1 ]; then
        return 0
    fi
    azSource "$1"
    azGuardSet "$guardName"
}
function azSourceSystem() {
    local file="$AZ_SYSTEM_DIR/$1"
    azSource "$file"
}
function azSourceSystemLab() {
    local file="$AZ_SYSTEM_DIR/lab/$1"
    azSource "$file"
}
function azSourceSystemModule() {
    local file="$AZ_SYSTEM_COMMANDS_DIR/$1"
    azSource "$file"
}
function azSourceSystemPlugin() {
    local file="$AZ_SYSTEM_PLUGIN_DIR/$1"
    azSource "$file"
}
