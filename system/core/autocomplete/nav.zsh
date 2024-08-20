function _nav {
  local -a nav_suggestions=()
  for key in "${(k)nav_list[@]}"; do
    echo _nav "Add suggestion: $key"
    nav_suggestions+=($key)
  done
  compadd -- ${nav_suggestions}
}
