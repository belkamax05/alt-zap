function az-nav() {
    local cmd=""
    local code_flag=0

    for arg in "$@"; do
        if [ "$arg" = "-c" ]; then
            code_flag=1
        elif [ -z "$cmd" ]; then
            cmd="$arg"
        fi
    done
    # echo "Nav s1 cmd=$cmd, code_flag=$code_flag"
    if [ -z "$cmd" ]; then
        azDebug "l14: No command provided"
        if ((code_flag)); then
            code -r .
        fi
        return
    fi

    #? Filtering system commands
    # echo "Nav s2 cmd=$cmd, code_flag=$code_flag"
    if [ "$cmd" = "list" ]; then
        az nav-list "$@"
        return 0
    fi

    #? Processing

    local dir="${nav_list[$cmd]}"
    if [ -z "$dir" ]; then
        #? location in dictionary not found, applying original argument $cmd
        azDebug "l34: location in dictionary not found, applying original argument $cmd"
        dir=$cmd
    fi

    # echo "Nav s3 cmd=$cmd, dir=$dir"
    if [ -n "$dir" ]; then
        # echo "Cding dir... $dir"
        cd $dir
        # load
        local newDir=$(pwd)
        if ((code_flag)); then
            code -r .
        fi
        if ((code_flag)); then
            echo "cd $newDir\nclear" >>"$STS_DIR/next_start.sh"
            restart
        fi
    fi

}
azGuardSetCommand "nav"
