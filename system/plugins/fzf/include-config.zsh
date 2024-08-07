#? Pre-experiments

# # Feed the output of fd into fzf
# fd --type f --strip-cwd-prefix | fzf

# # Setting fd as the default source for fzf
# export FZF_DEFAULT_COMMAND='fd --type f'

# # Now fzf (w/o pipe) will use the fd command to generate the list
# fzf

# # To apply the command to CTRL-T as well
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#? Variables

open_command="xargs -r code-insiders"
preview_base="--preview 'fzf-preview.sh {}'"
preview_ui="--height 100% --info inline --border \
    --preview 'fzf-preview.sh {}' --preview-window right,50%,border-horizontal \
    --bind 'ctrl-/:change-preview-window(50%|hidden|)' \
    --color 'fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899'"

#? Initialisation

#? Core configuration

# https://github.com/junegunn/fzf#readme
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source <(fzf --zsh)
# HISTFILE=~/.zsh_history
# HISTSIZE=10000
# SAVEHIST=10000
# setopt appendhistory

#? Finalise

#? Aliases

alias fp="fzf ${preview_base} | ${open_command}"
alias f="fzf ${preview_ui} | ${open_command}"

#? Exports

export FZF_DEFAULT_COMMAND="$DEFAULT_FILE_FINDER --type f --strip-cwd-prefix --hidden --follow --exclude .git"
# set -g FZF_CTRL_T_COMMAND "command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"
# export FZF_DEFAULT_COMMAND='ag -l --path-to-ignore ~/.ignore --nocolor --hidden -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#? Post-experiments

# export FZF_DEFAULT_COMMAND="fzf ${layout_ui} | ${open_command}"
# export FZF_CTRL_T_COMMAND="fzf ${layout_preview} | ${open_command}"
# set -gx FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git --exclude node_modules"

# set -gx FZF_COMPLETION_TRIGGER '@@'
# set -gx FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border --preview-window down:1"
# set -gx FZF_ALT_C_COMMAND "fd -t d . $HOME"
# set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
