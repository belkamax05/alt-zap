function stsCloneSource() {
    local src="$1"
    local dest="$2"
    local importFile="$3"
    if [ ! -d "$dest" ]; then
        git clone "$src" "$dest"
    fi
    if [ -n "$importFile" ]; then
        source "$dest/$importFile"
    fi
}
