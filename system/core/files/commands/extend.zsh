function az-extend {
    if [ "$1" = "nav" ]; then
        shift
        az extend-nav "$@"
    else
        echo "Unknown extend command $1"
    fi
}
azGuardSetCommand "extend"
