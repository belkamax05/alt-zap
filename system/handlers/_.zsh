for module_name in command_not_found_handler bindings nav_autocomplete; do
    source "$AZ_DIR/system/handlers/$module_name.zsh"
done
