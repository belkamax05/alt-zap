if [ ! -f "$AZ_CORE_COMPILED_PATH" ]; then
    azCoreSource "build.zsh"
fi
azCoreSource "run.zsh"
