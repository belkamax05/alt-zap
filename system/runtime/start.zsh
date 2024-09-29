export AZ_RUNTIME_DIR=$(dirname "${(%):-%N}")
source "$AZ_DIR/system/define/include.zsh"

azCoreSource start.zsh
azFunc azUser-init_directory
