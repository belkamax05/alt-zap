for module_name in az azDebug azError azInfo azInclude azFindCommand azRunFile; do
    source "$AZ_ROOT/system/core/functions/$module_name.zsh"
done
