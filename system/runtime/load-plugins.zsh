for plugin in nvm zap fzf fzf-tab mvn; do
    azSourceSystemPlugin "$plugin/include.zsh"
done

# #! Zap plugins
# #? https://github.com/zsh-users/zsh-autosuggestions
# #? https://github.com/zsh-users/zsh-completions
for plugin in \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions \
    zsh-users/zsh-syntax-highlighting \
    wintermi/zsh-lsd \
    zap-zsh/supercharge; do
    plug "$plugin"
done
# zap-zsh/zap-prompt

# plug "zap-zsh/zap-prompt"
# for plugin in brew p10k lsd nvm mvn fzf; do
#     # az include-plugin "$plugin"
#     azSourceSystemPlugin "$plugin/include.zsh"
# done
