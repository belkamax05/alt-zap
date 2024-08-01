#!/bin/zsh
for module_name in defines/_ functions/_ handlers/_; do
    source "$AZ_ROOT/system/$module_name.zsh"
done

for command in cli; do
    azIncludeModule "$command"
done
