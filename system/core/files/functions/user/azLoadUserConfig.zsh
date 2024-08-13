function azLoadUserConfig() {
    AZ_DEBUG=$(jq -r .debug "$AZ_CONFIG_FILE")
}
