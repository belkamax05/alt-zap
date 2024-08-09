function az-load-handlers() {
    for module_name in handlers/_; do
        source "$AZ_DIR/system/$module_name.zsh"
    done
}
