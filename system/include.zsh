#!/bin/zsh
local AZ_START_TIME=$(date +%s)
#? Core plugins

source "$AZ_DIR/system/core/include.zsh"

for command in nav cli here; do
    az load-module "$command"
    az alias-module "$command"
done

az load-user-config
az include-plugins
az load-user
az load-handlers
az load-autocomplete

local AZ_END_TIME=$(date +%s)
azDebug "${AZ_C_CYAN}[az.sh]${AZ_C_RESET} loaded in ${AZ_C_YELLOW}$((AZ_END_TIME - AZ_START_TIME))${AZ_C_RESET} seconds"
