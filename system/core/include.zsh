function azCoreInclude() {
    source "$AZ_DIR/system/core/files/initial/paths.zsh"

    if [ -f "$AZ_CORE_COMPILED_PATH" ]; then
        source "$AZ_CORE_COMPILED_PATH"
    else
        source "$AZ_DIR/system/core/compile.zsh"
        if [ ! -f "$AZ_CORE_COMPILED_PATH" ]; then
            echo "Error: Core compiled file not found: $AZ_CORE_COMPILED_PATH" # TODO azError
        fi
    fi
}
azCoreInclude
