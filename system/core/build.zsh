(
    local coreFile="$AZ_CORE_COMPILED_PATH"
    local minify=1 # 0 - no minify, 1 - minify
    rm -f "$coreFile"
    touch "$coreFile"

    local srcDir="$AZ_DIR/system/core/files"

    local files=(
        "$srcDir/initial/paths.zsh"
        "$srcDir/initial/colors.zsh"
        "$srcDir/initial/preffix.zsh"
        "$srcDir/initial/variables.zsh"

        "$srcDir/functions/trace.zsh"
        "$srcDir/functions/debug.zsh"
        "$srcDir/functions/echo.zsh"
        "$srcDir/functions/guard.zsh"
        "$srcDir/functions/source.zsh"
        "$srcDir/functions/command.zsh"
        "$srcDir/functions/run.zsh"
        "$srcDir/functions/user.zsh"

        "$srcDir/env/paths.zsh"

        "$srcDir/plugin/zap.zsh"

        "$srcDir/commands/az.zsh"
        "$srcDir/commands/here.zsh"

        "$srcDir/handler/load-user.zsh"
        "$srcDir/handler/bindings.zsh"
        "$srcDir/handler/not-found.zsh"

        "$srcDir/autocomplete/init.zsh"
        "$srcDir/autocomplete/az.zsh"
        "$srcDir/autocomplete/nav.zsh"

        "$srcDir/runtime/config-init.zsh"
        "$srcDir/runtime/variables.zsh"
        "$srcDir/runtime/alias.zsh"

    )

    for file in "${files[@]}"; do
        if [ -f "$file" ]; then
            if [ "$minify" -eq 0 ]; then
                echo "# File: ${file#$srcDir}" >>"$coreFile"
            fi
            cat "$file" >>"$coreFile"
            # echo "" >>"$coreFile"
            # echo "echo \"File is $file\"" >>"$coreFile"
            echo "" >>"$coreFile"
        else
            echo "Error: Core file not found: $file" # TODO azError
        fi
    done

    if [ "$minify" -eq 1 ]; then
        sed -e '/^#/d' -e '/^$/d' -e 's/[[:space:]]\{1,\}/ /g' -e 's/[[:space:]]*$//' $coreFile >$AZ_CORE_COMPILED_MIN_PATH
        cp "$AZ_CORE_COMPILED_MIN_PATH" "$coreFile"
        rm -f "$AZ_CORE_COMPILED_MIN_PATH"
    fi
)
