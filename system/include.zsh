#!/bin/zsh

#? Core plugins

for module_name in defines/_ functions/_; do
    source "$AZ_DIR/system/$module_name.zsh"
done

for command in nav cli here; do
    eval "function $command() { az $command \$@; }"
    azIncludeModule "$command"
done

#? Vendor plugins

source "$AZ_DIR/system/plugins/include.zsh"

#? Projects load

source "$AZ_CONFIG_DIR/include.zsh"

#? Finalize load

for module_name in handlers/_; do
    source "$AZ_DIR/system/$module_name.zsh"
done

source "$AZ_DIR/system/az.autocomplete.zsh"
