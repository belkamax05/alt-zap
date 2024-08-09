function azInclude() {
    local includeFile="$AZ_DIR/$1"
    if [ -f "$includeFile" ]; then
        source "$includeFile"
    else
        azError "Error: include file not found: $includeFile"
    fi
}
