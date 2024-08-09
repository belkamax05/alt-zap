typeset -gA nav_list

for module_name in azInclude azRunModule azIncludeModule azFindCommand azRunFile; do
    source "$AZ_DIR/system/defines/$module_name.zsh"
done
