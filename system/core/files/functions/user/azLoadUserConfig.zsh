function azLoadUserConfig() {
    export AZ_DEBUG=$(jq -r .debug "$AZ_CONFIG_FILE")
}
