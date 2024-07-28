function azInclude() {
    local includeFile="$AZ_ROOT/$1"
    if [ -f "$includeFile" ]; then
        source "$includeFile"
    else
        azError "Error: include file not found: $includeFile"
    fi
}
