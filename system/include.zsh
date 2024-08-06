#!/bin/zsh
for module_name in defines/_ functions/_ handlers/_; do
    source "$AZ_DIR/system/$module_name.zsh"
done

for command in cli; do
    azIncludeModule "$command"
done

#? Plugin managers
for plugin in zap; do
    azIncludePlugin "$plugin"
done

for plugin in "zsh-users/zsh-autosuggestions" "zsh-users/zsh-completions"; do
    plug "$plugin"
done
# plug "zsh-users/zsh-autosuggestions" #? https://github.com/zsh-users/zsh-autosuggestions
# plug "zsh-users/zsh-completions" #? https://github.com/zsh-users/zsh-completions

for plugin in p10k lsd nvm; do
    azIncludePlugin "$plugin"
done
