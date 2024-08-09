for module_name in debug paths alias colors text-preffix; do
    source "$AZ_DIR/system/defines/$module_name.zsh"
done

typeset -gA nav_list

for module_name in azDebug azInclude azRunModule azIncludeModule azFindCommand azRunFile; do
    source "$AZ_DIR/system/defines/$module_name.zsh"
done
