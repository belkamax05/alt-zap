function az-nav-list () {
    for key in "${(k)nav_list[@]}"; do
        echo "$key: ${nav_list[$key]}"
    done
}