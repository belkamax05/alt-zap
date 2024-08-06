# AZ_DIR - the root directory of the az framework (path/to/alt-zap)

if [ -z "${AZ_CONFIG_PATH}" ]; then
    AZ_CONFIG_PATH="$HOME/.az"
fi

export AZ_PLUGIN_DIR="$AZ_DIR/system/plugins"
