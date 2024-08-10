function azCoreCompile() {
    local coreFile="$AZ_CORE_COMPILED_PATH"
    local minify=1 # 0 - no minify, 1 - minify
    rm -f "$coreFile"
    touch "$coreFile"

    local srcDir="$AZ_DIR/system/core/files"
    local files=(
        "$srcDir/define-paths.zsh"
        "$srcDir/define-colors.zsh"
        "$srcDir/define-preffix.zsh"
        "$srcDir/define-runtime.zsh"
        "$srcDir/global-alias.zsh"
        "$srcDir/functions-debug.zsh"
        "$srcDir/functions-echo.zsh"
        "$srcDir/functions-source.zsh"
        "$srcDir/functions-run.zsh"
        "$srcDir/functions-user.zsh"
        "$srcDir/module-az.zsh"
        "$srcDir/handler-load-user.zsh"
    )

    for file in "${files[@]}"; do
        if [ -f "$file" ]; then
            if [ "$minify" -eq 0 ]; then
                echo "# File: ${file#$srcDir}" >>"$coreFile"
            fi
            cat "$file" >>"$coreFile"
        else
            echo "Error: Core file not found: $file" # TODO azError
        fi
    done

    if [ "$minify" -eq 1 ]; then
        sed -e '/^#/d' -e '/^$/d' -e 's/[[:space:]]\{1,\}/ /g' -e 's/[[:space:]]*$//' $coreFile >$AZ_CORE_COMPILED_MIN_PATH
        cp "$AZ_CORE_COMPILED_MIN_PATH" "$coreFile"
        rm -f "$AZ_CORE_COMPILED_MIN_PATH"
    fi

    source "$AZ_DIR/system/core/include.zsh"
}
azCoreCompile
