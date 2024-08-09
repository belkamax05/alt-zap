# debug-echo-info "Plugins loading..."
# import "plugins/fzf/_"

#? zgen manager - https://github.com/tarjoilija/zgen
debug-echo-info "zgen loading..."
import "plugins/zgen/_"

#? zgen plugins
zgen load 'torifat/npms'

#? zap plugins
# plug "zsh-users/zsh-autosuggestions" #? https://github.com/zsh-users/zsh-autosuggestions
plug "zap-zsh/supercharge" #? https://github.com/zap-zsh/supercharge
# plug "zap-zsh/zap-prompt"              #? https://github.com/zap-zsh/zap-prompt
plug "zsh-users/zsh-syntax-highlighting" #? https://github.com/zsh-users/zsh-syntax-highlighting
# plug "zsh-users/zsh-completions"         #? https://github.com/zsh-users/zsh-completions

# plug "wintermi/zsh-lsd" # A zsh plugin to override ls and tree commands with lsd instead.

# import "plugins/nvm/_"

#? zshell / zinit plugins

# zinit ice atload"zpcdreplay" atclone'./zplug.zsh'
# zinit light g-plane/zsh-yarn-autocompletions

#? zplug plugins
debug-echo-info "zplug loading..."
source ~/.zplug/init.zsh

# zplug "g-plane/zsh-yarn-autocompletions", hook-build:"./zplug.zsh", defer:2

#? Temp code
