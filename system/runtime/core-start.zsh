if [ ! -f "$AZ_CORE_COMPILED_PATH" ]; then
    azRuntimeSource "core-build.zsh"
fi
source "$AZ_CORE_COMPILED_PATH"
