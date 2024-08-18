#!/bin/zsh
local AZ_START_TIME=$(date +%s)

source "$AZ_DIR/system/runtime/start.zsh"

local AZ_END_TIME=$(date +%s)
azDebug "${AZ_C_CYAN}[az.sh]${AZ_C_RESET} loaded in ${AZ_C_YELLOW}$((AZ_END_TIME - AZ_START_TIME))${AZ_C_RESET} seconds"
