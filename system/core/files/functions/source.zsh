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

function azIncludeModule() {
    local command="$1"
    AZ_INCLUDE_GUARD="INCLUDED_${command//-/_}_ZSH"
    print -v AZ_GUARD_VALUE -- "${(P)AZ_INCLUDE_GUARD}" #? Comment temprorary to autoformat file
    #? System Modules
    if [[ -f "$AZ_DIR/system/modules/az-$command.zsh" && -z "$AZ_GUARD_VALUE" ]]; then
        azDebug "${AZ_C_CYAN}[azIncludeModule]${AZ_C_RESET} Initialize '${AZ_C_YELLOW}$command${AZ_C_RESET}' module"
        azSource "system/modules/az-$command.zsh"
        eval "$AZ_INCLUDE_GUARD=1"
    fi
}