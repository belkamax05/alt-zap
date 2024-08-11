function azGuardSet() {
    local name="$1"
    azTraceGuard "Guard set: '${AZ_C_YELLOW}$name${AZ_C_RESET}'"
    AZ_GUARD="AZ_GUARD_${name//-/_}_ZSH"
    eval "$AZ_GUARD=1"
}
function azGuardUnset() {
    local name="$1"
    azTraceGuard "Guard unset: '${AZ_C_YELLOW}$name${AZ_C_RESET}'"
    AZ_GUARD="AZ_GUARD_${name//-/_}_ZSH"
    eval "$AZ_GUARD=0"
}

function azGuardCheck() {
    local name="$1"
    AZ_GUARD="AZ_GUARD_${name//-/_}_ZSH"
    print -v AZ_GUARD_VALUE -- "${(P)AZ_GUARD}"
    if [ "$AZ_GUARD_VALUE" -eq 1 ]; then
        azTraceGuard "Guard for '${AZ_C_YELLOW}$name${AZ_C_RESET}' is set"
        return 1
    fi
    azTraceGuard "Guard for '${AZ_C_YELLOW}$name${AZ_C_RESET}' is unset"
    return 0
}

# azGuardCheck "TEST1"
# echo "TEST1a: $?"

# azGuardSet "TEST1"

# azGuardCheck "TEST1"
# echo "TEST1b: $?"

# azGuardUnset "TEST1"

# azGuardCheck "TEST1"
# echo "TEST1c: $?"