function az-extend-nav {
    # echo "azExtendNav params: $0, $1, $2, $3"
    local cmd="$1"
    local dir="$2"
    # echo "azExtendNav params: cmd=$cmd, dir=$dir"
    nav_list[$cmd]="$dir"
}
