#!/bin/zsh

AZ_DEBUG=0

for module_name in defines/_ functions/_ handlers/_ alias/_; do
    source "$AZ_ROOT/system/$module_name.zsh"
done

for command in cli; do
    azIncludeModule "$command"
done
