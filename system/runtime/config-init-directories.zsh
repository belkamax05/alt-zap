if [ ! -d "$AZ_CONFIG_DIR" ]; then
    mkdir -p "$AZ_CONFIG_DIR"
fi
if [ ! -d "$AZ_CONFIG_DIR/bin" ]; then
    mkdir -p "$AZ_CONFIG_DIR/bin"
fi
if [ ! -d "$AZ_CONFIG_DIR/cloned" ]; then
    mkdir -p "$AZ_CONFIG_DIR/cloned"
fi
