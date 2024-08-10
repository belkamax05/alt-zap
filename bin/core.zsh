export AZ_CONFIG_DIR=${AZ_CONFIG_DIR:-"$HOME/.az"}
export NVM_DIR=${NVM_DIR:-"$AZ_CONFIG_DIR/bin/.nvm"}
export AZ_PLUGIN_DIR="$AZ_DIR/system/plugins"
export AZ_CORE_COMPILED_PATH="$AZ_DIR/bin/core.zsh"
export AZ_CORE_COMPILED_MIN_PATH="$AZ_DIR/bin/core.min.zsh"
export PATH="$AZ_CONFIG_DIR/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export AZ_C_RESET="\033[0m"
export AZ_C_BOLD="\033[1m"
export AZ_C_CYAN="\033[38;5;51m" #00FFFF
export AZ_C_DARK_RED="\033[38;5;196m" #FF3131
export AZ_C_YELLOW="\033[38;5;226m" #FFFF00
export AZ_C_HOTPINK="\033[38;5;199m" #FF00AF
export AZ_C_GREEN="\033[38;5;46m" #00FF00
export AZ_C_MAGENTA="\033[38;2;201;101;201m" #C965C9
export AZ_C_ERROR="$AZ_C_DARK_RED"
export AZ_C_DEBUG="$AZ_C_MAGENTA"
export AZ_PREFFIX="⌥⎇ sh "
export AZ_PREFFIX_ECHO="${AZ_C_CYAN}$AZ_PREFFIX${AZ_C_RESET} 💬"
export AZ_PREFFIX_ERROR="${AZ_C_ERROR}$AZ_PREFFIX${AZ_C_RESET} ❌"
export AZ_PREFFIX_SUCCESS="${AZ_C_CYAN}$AZ_PREFFIX${AZ_C_RESET} ✅"
export AZ_PREFFIX_INFO="${AZ_C_CYAN}$AZ_PREFFIX${AZ_C_RESET} ℹ️"
export AZ_PREFFIX_DEBUG="${AZ_C_DEBUG}$AZ_PREFFIX${AZ_C_RESET} 🚧"
export AZ_DEBUG=${AZ_DEBUG:-0}
alias rs="az restart"
alias l="az load"
alias rl="az reload"
alias rr="az restart"
alias up="az up"
alias clr="clear"
alias c="clear"
alias dir='ls'
function az-is-debug() {
 if [ "$AZ_DEBUG" -eq 1 ]; then
 return 0
 fi
 return 1
}
function az-no-debug() {
 if az-is-debug; then
 return 1
 else
 return 0
 fi
}
function azDebug() {
 if [ "$AZ_DEBUG" -eq 0 ]; then
 return 0
 fi
 echo "$AZ_PREFFIX_DEBUG $@"
}
function azError() {
 echo "$AZ_PREFFIX_ERROR $@"
}
function azSuccess() {
 echo "$AZ_PREFFIX_SUCCESS $@"
}
function azInfo() {
 echo "$AZ_PREFFIX_INFO $@"
}
function azEcho() {
 echo "$AZ_PREFFIX_ECHO $@"
}
function azInclude() {
 local includeFile="$AZ_DIR/$1"
 if [ -f "$includeFile" ]; then
 source "$includeFile"
 else
 azError "Error: include file not found: $includeFile"
 fi
}
