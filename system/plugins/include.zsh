#! Plugin managers
#? zap manager - https://github.com/zap-zsh/zap
for plugin in zap; do
    azIncludePlugin "$plugin"
done

#! Zap plugins
#? https://github.com/zsh-users/zsh-autosuggestions
#? https://github.com/zsh-users/zsh-completions
for plugin in "zsh-users/zsh-autosuggestions" "zsh-users/zsh-completions"; do
    plug "$plugin"
done

for plugin in p10k lsd nvm mvn fzf; do
    azIncludePlugin "$plugin"
done
