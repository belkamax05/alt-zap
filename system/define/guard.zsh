function azGuardSet() {
    local name="$1"
    azTraceGuard "Set '${AZ_C_YELLOW}$name${AZ_C_RESET}'"
    AZ_GUARD="AZ_GUARD_${name//-/_}_ZSH"
    eval "$AZ_GUARD=1"
}
function azGuardUnset() {
    local name="$1"
    azTraceGuard "Unset '${AZ_C_YELLOW}$name${AZ_C_RESET}'"
    AZ_GUARD="AZ_GUARD_${name//-/_}_ZSH"
    eval "$AZ_GUARD=0"
}
function azGuardCheck() {
    local name="$1"
    AZ_GUARD="AZ_GUARD_${name//-/_}_ZSH"
    print -v AZ_GUARD_VALUE -- "${(P)AZ_GUARD}"
    if [ "$AZ_GUARD_VALUE" -eq 1 ]; then
        return 1
    fi
    return 0
}