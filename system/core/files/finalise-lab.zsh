function finaliseExec() {
    local xxValue=$(jq -r .xx ~/.az/user-config.json)
    azInfo "${AZ_C_CYAN}[finalize-lab]${AZ_C_RESET} !!!! Finalise exec $xxValue"
}
finaliseExec
