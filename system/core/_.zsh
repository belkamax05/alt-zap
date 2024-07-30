for module_name in defines/_ functions/_ handlers/_ alias/_; do
    source "$AZ_ROOT/system/core/$module_name.zsh"
done

for command in cli; do
    azIncludeModule "$command"
done
