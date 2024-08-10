function _nav {
  local -a nav_suggestions=()
  for key in "${(k)nav_list[@]}"; do
    echo "Add suggestion: $key"
    nav_suggestions+=($key)
  done
  compadd -- ${nav_suggestions}
}
compdef _nav az nav
