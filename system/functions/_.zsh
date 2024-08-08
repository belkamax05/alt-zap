for module_name in azDebug az azInclude azRunModule azIncludeModule azFindCommand azRunFile; do
    source "$AZ_DIR/system/functions/$module_name.zsh"
done
