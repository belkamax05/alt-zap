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
typeset -gA nav_list
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
function azIncludeModule() {
 local command="$1"
 AZ_INCLUDE_GUARD="INCLUDED_${command//-/_}_ZSH"
 print -v AZ_GUARD_VALUE -- "${(P)AZ_INCLUDE_GUARD}" #? Comment temprorary to autoformat file
 #? System Modules
 if [[ -f "$AZ_DIR/system/modules/az-$command.zsh" && -z "$AZ_GUARD_VALUE" ]]; then
 azDebug "${AZ_C_CYAN}[azIncludeModule]${AZ_C_RESET} Initialize '${AZ_C_YELLOW}$command${AZ_C_RESET}' module"
 azInclude "system/modules/az-$command.zsh"
 eval "$AZ_INCLUDE_GUARD=1"
 fi
}
function azRunModule() {
 print -v AZ_GUARD_VALUE -- "${(P)AZ_INCLUDE_GUARD}" #? Comment temprorary to autoformat file
 if [ "$AZ_GUARD_VALUE" = "1" ]; then
 azDebug "${AZ_C_CYAN}[azRunModule]${AZ_C_RESET} Run '${AZ_C_YELLOW}$command${AZ_C_RESET}' module"
 az-$command "${@:2}"
 return 0
 fi
 azError "[azRunModule] Runner for module '${AZ_C_YELLOW}$command${AZ_C_RESET}' was not found"
 return 1
}
function azRunFile() {
 azDebug "[azRunFile] ${AZ_C_YELLOW}$@${AZ_C_RESET}"
 local filePath="$1"
 local fileExtension="${filePath##*.}"
 if [ -f "$filePath" ]; then
 if [ "$fileExtension" = "sh" ]; then
 azDebug "Include shell script $filePath"
 source "$filePath"
 return 0
 elif [ "$fileExtension" = "zsh" ]; then
 azDebug "Include shell script $filePath"
 source "$filePath"
 return 0
 elif [ "$fileExtension" = "js" ]; then
 azDebug "Include shell script $filePath"
 node "$filePath"
 return 0
 elif [ "$fileExtension" = "ts" ]; then
 azDebug "Include shell script $filePath"
 "$AZ_DIR/node_modules/.bin/ts-node" "$filePath"
 return 0
 fi
 fi
 azError "[azRunFile] Runner for file $filePath was not found"
 return 1
}
function azFindCommand() {
 azDebug "${AZ_C_CYAN}[azFindCommand]${AZ_C_RESET} ${AZ_C_YELLOW}$@${AZ_C_RESET}"
 local command="$1"
 if [[ -f "$AZ_DIR/system/modules/az-$command.zsh" ]]; then
 azIncludeModule "$command" "${@:2}"
 azRunModule "$command" "${@:2}"
 return 0
 fi
 #? System Scripts
 if [[ -f "$AZ_DIR/system/scripts/$command" ]]; then
 azDebug "Include script $command"
 azInclude "system/scripts/$command"
 return 0
 fi
 if [[ -f "$AZ_DIR/system/scripts/$command.zsh" ]]; then
 azDebug "Include script $command.zsh"
 azInclude "system/scripts/$command.zsh"
 return 0
 fi
 #? Path files
 local filePath="$PWD/$command"
 if [ -f "$filePath" ]; then
 azDebug "Include file $filePath"
 azRunFile "$filePath" "${@:2}"
 return 0
 fi
 #? Script in js
 # if [[ -f "$AZ_DIR/apps/cli/src/commands/$command.ts" ]]; then
 # azDebug "Include script $command.ts"
 # az cli "$@"
 # return 0
 # fi
 # az clix "$@"
 # if [ $? -eq 0 ]; then
 # echo "Command found A: $command"
 # return 0
 # fi
 # echo "Command not found B: $command"
 az cli "$@"
 return 0
}
function az() {
 if [ -z "$1" ]; then
 echo "!az! Default view TODO replace"
 return
 fi
 local command="$1"
 azFindCommand "$@"
 if [ $? -eq 0 ]; then
 return 0
 fi
 azError "[az.zsh] Module '${AZ_C_YELLOW}$1${AZ_C_RESET}'${2:+ (arguments ${AZ_C_YELLOW}${@:2}${AZ_C_RESET})} could not be loaded. Does not exist or error prevents loading."
 return 1
}
