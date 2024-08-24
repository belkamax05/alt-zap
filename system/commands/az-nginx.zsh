function az-nginx() {
    local command=$1

    if [ "$command" = "start" ]; then
        $AZ_CONFIG_DIR/projects/nginx/start.zsh
    elif [ "$command" = "stop" ]; then
        $AZ_CONFIG_DIR/projects/nginx/stop.zsh
    elif [ "$command" = "restart" ]; then
        $AZ_CONFIG_DIR/projects/nginx/restart.zsh
    elif [ "$command" = "validate" ]; then
        $AZ_CONFIG_DIR/projects/nginx/validate.zsh
    elif [ "$command" = "status" ]; then
        $AZ_CONFIG_DIR/projects/nginx/status.zsh
    else
        azError "Invalid command. Usage: az-nginx [start|stop|restart|status]"
    fi
}
