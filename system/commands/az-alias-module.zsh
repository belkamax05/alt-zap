function az-alias-module() {
    local module_name="$1"
    eval "function $module_name() { az $module_name \$@; }"
}
