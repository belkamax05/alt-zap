function azConfigInit() {
    if [ ! -f "$AZ_CONFIG_FILE" ]; then
        az cli config/initialise
    fi
}
