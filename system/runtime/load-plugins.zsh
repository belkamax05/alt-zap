for plugin in nvm zap fzf-tab; do
    azSourceSystemPlugin "$plugin/include.zsh"
done

# #! Zap plugins
# #? https://github.com/zsh-users/zsh-autosuggestions
# #? https://github.com/zsh-users/zsh-completions
for plugin in \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions \
    zsh-users/zsh-syntax-highlighting \
    zap-zsh/supercharge; do # zap-zsh/zap-prompt \
    plug "$plugin"
done

# plug "zap-zsh/zap-prompt"
# plug "zsh-users/zsh-syntax-highlighting"

# for plugin in brew p10k lsd nvm mvn fzf; do
#     # az include-plugin "$plugin"
#     azSourceSystemPlugin "$plugin/include.zsh"
# done
