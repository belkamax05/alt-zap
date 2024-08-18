source "$AZ_DIR/system/runtime/define.zsh"

azCoreSource static/paths.zsh
azRuntimeSource core-start.zsh
azRuntimeSource config-init-directories.zsh
azRuntimeSource config-init-user-file.zsh
azRuntimeSource config-load-user-file.zsh
azConfigSource init.zsh
azConfigSource start.zsh
azRuntimeSource load-plugins.zsh
azRuntimeSource load-kali-configuration.zsh

# azSourceSystemPlugin "include.zsh"


# azFunc azAllTests