function azSource() {
    local file="$AZ_DIR/$1"
    azTraceSource "${AZ_C_CYAN}[azSource]${AZ_C_RESET} Sourcing $file"
    source "$file"
}
function azSourceSystem() {
    local file="$AZ_DIR/system/$1"
    azTraceSource "${AZ_C_CYAN}[azSourceSystem]${AZ_C_RESET} Sourcing $file"
    source "$file"
}
function azSourceSystemLab() {
    local file="$AZ_DIR/system/lab/$1"
    azTraceSource "${AZ_C_CYAN}[azSourceSystemLab]${AZ_C_RESET} Sourcing $file"
    source "$file"
}
function azSourceSystemModule() {
    local file="$AZ_DIR/system/modules/$1"
    azTraceSource "${AZ_C_CYAN}[azSourceSystemModule]${AZ_C_RESET} Sourcing $file"
    source "$file"
}
function azSourceSystemPlugin() {
    local file="$AZ_PLUGIN_DIR/$1"
    azTraceSource "${AZ_C_CYAN}[azSourceSystemPlugin]${AZ_C_RESET} Sourcing $file"
    source "$file"
}
