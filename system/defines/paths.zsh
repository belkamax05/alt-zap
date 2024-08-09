# AZ_DIR - the root directory of the az framework (path/to/alt-zap)

if [ -z "${AZ_CONFIG_PATH}" ]; then
    AZ_CONFIG_PATH="$HOME/.az"
fi
# if [ -z "${NVM_DIR}" ]; then
#     NVM_DIR="$AZ_CONFIG_DIR/bin/.nvm"
# fi

export AZ_PLUGIN_DIR="$AZ_DIR/system/plugins"

export PATH="$AZ_CONFIG_DIR/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
