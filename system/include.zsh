#!/bin/zsh
local AZ_START_TIME=$(date +%s)
#? Core plugins

export AZ_CONFIG_DIR="${AZ_CONFIG_DIR:-$HOME/.az}"

if [ -f "$AZ_CONFIG_DIR/user-config.zsh" ]; then
    source "$AZ_CONFIG_DIR/user-config.zsh"
fi

for module_name in defines/_; do
    source "$AZ_DIR/system/$module_name.zsh"
done

source "$AZ_DIR/system/modules/az.zsh"
for command in nav cli here; do
    eval "function $command() { az $command \$@; }"
    az include-module "$command"
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
local AZ_END_TIME=$(date +%s)
azDebug "az.sh loaded in $((AZ_END_TIME - AZ_START_TIME)) seconds"
