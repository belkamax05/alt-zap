# root
export AZ_BIN_DIR="$AZ_DIR/bin"
export AZ_SYSTEM_DIR="$AZ_DIR/system"

# bin
export AZ_CORE_COMPILED_PATH="$AZ_BIN_DIR/core.zsh"
export AZ_CORE_COMPILED_MIN_PATH="$AZ_BIN_DIR/core.min.zsh"

# system
export AZ_PLUGINS_DIR="$AZ_SYSTEM_DIR/plugins"
export AZ_COMMANDS_DIR="$AZ_SYSTEM_DIR/commands"
export AZ_FUNCTIONS_DIR="$AZ_SYSTEM_DIR/functions"
export AZ_DEFAULTS_DIR="$AZ_SYSTEM_DIR/defaults"

# installed plugins
export FZF_TAB_DIR=${FZF_TAB_DIR:-"$AZ_PLUGINS_INSTALLED_DIR/fzf-tab"}
