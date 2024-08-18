(
    local coreFile="$AZ_CORE_COMPILED_PATH"
    local minify=1 # 0 - no minify, 1 - minify
    rm -f "$coreFile"
    touch "$coreFile"

    local srcDir="$AZ_DIR/system/core"

    local files=(
        "$srcDir/static/env-paths.zsh"
        "$srcDir/static/colors.zsh"
        "$srcDir/static/preffix.zsh"
        "$srcDir/static/variables.zsh"
        "$srcDir/static/alias.zsh"

        "$srcDir/functions/debug.zsh"
        "$srcDir/functions/echo.zsh"
        "$srcDir/functions/functions.zsh"
        "$srcDir/functions/commands.zsh"
        "$srcDir/functions/run.zsh"

        "$srcDir/plugin/zap.zsh"

        "$srcDir/commands/az.zsh"
        "$srcDir/commands/not-found.zsh"
        "$srcDir/commands/here.zsh"
        "$srcDir/commands/nav.zsh"
        "$srcDir/commands/extend-nav.zsh"
        "$srcDir/commands/extend.zsh"
        "$srcDir/commands/cli.zsh"

        "$srcDir/handler/bindings.zsh"
        "$srcDir/handler/not-found.zsh"

        "$srcDir/autocomplete/init.zsh"
        "$srcDir/autocomplete/az.zsh"
        "$srcDir/autocomplete/nav.zsh"

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
