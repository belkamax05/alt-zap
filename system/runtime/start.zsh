export AZ_RUNTIME_DIR=$(dirname "${(%):-%N}")
source "$AZ_DIR/system/define/include.zsh"

if [ -f "$AZ_CONFIG_INIT" ]; then
    azConfigSource init.zsh
fi
azCoreSource start.zsh
azFunc azUser-init_directory
azRuntimeSource config-init-user-file.zsh
azRuntimeSource config-load-user-file.zsh
azConfigSource load.zsh
azRuntimeSource load-plugins.zsh
azRuntimeSource load-kali-configuration.zsh
azConfigSource start.zsh

# azSourceSystemPlugin "include.zsh"


# azFunc azAllTests