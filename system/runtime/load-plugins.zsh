if [ ! -d "$NVM_DIR" ]; then
    az install nvm
    nvm install
fi
azSourceSystemPlugin "nvm/include.zsh"

# #! Plugin managers
# #? zap manager - https://github.com/zap-zsh/zap
# for plugin in zap; do
#     # az include-plugin "$plugin"
#     azSourceSystemPlugin "$plugin/include.zsh"
# done

# #! Zap plugins
# #? https://github.com/zsh-users/zsh-autosuggestions
# #? https://github.com/zsh-users/zsh-completions
for plugin in "zsh-users/zsh-autosuggestions" "zsh-users/zsh-completions"; do
    plug "$plugin"
done

for plugin in brew p10k lsd nvm mvn fzf; do
    # az include-plugin "$plugin"
    azSourceSystemPlugin "$plugin/include.zsh"
done
