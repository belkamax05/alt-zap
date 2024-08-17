#!/bin/zsh
local AZ_START_TIME=$(date +%s)

source "$AZ_DIR/system/core/include.zsh"

azSourceSystemPlugin "include.zsh"
azSourceSystem "lab/include.zsh"

azRuntimeInstall
azRuntimeStart

source "$AZ_DIR/system/sort/kali-default.zsh"

local AZ_END_TIME=$(date +%s)
azDebug "${AZ_C_CYAN}[az.sh]${AZ_C_RESET} loaded in ${AZ_C_YELLOW}$((AZ_END_TIME - AZ_START_TIME))${AZ_C_RESET} seconds"
