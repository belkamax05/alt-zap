for module_name in az azDebug azError azInfo azInclude azRunModule azIncludeModule azFindCommand azRunFile; do
    source "$AZ_ROOT/system/functions/$module_name.zsh"
done