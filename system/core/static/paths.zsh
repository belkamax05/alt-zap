export AZ_BIN_DIR="$AZ_DIR/bin"
export AZ_SYSTEM_DIR="$AZ_DIR/system"

export AZ_CORE_COMPILED_PATH="$AZ_BIN_DIR/core.zsh"
export AZ_CORE_COMPILED_MIN_PATH="$AZ_BIN_DIR/core.min.zsh"

export AZ_PLUGINS_DIR="$AZ_SYSTEM_DIR/plugins"
export AZ_COMMANDS_DIR="$AZ_SYSTEM_DIR/commands"
export AZ_FUNCTIONS_DIR="$AZ_SYSTEM_DIR/functions"

export AZ_CONFIG_DIR="${AZ_CONFIG_DIR:-$HOME/.az}"
export AZ_CONFIG_FILE="$AZ_CONFIG_DIR/user-config.json"
export NVM_DIR=${NVM_DIR:-"$AZ_CONFIG_DIR/bin/.nvm"}