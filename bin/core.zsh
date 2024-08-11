export AZ_CONFIG_DIR="${AZ_CONFIG_DIR:-$HOME/.az}"
export AZ_CONFIG_FILE="$AZ_CONFIG_DIR/user-config.json"
export NVM_DIR=${NVM_DIR:-"$AZ_CONFIG_DIR/bin/.nvm"}
export AZ_PLUGIN_DIR="$AZ_DIR/system/plugins"
export AZ_CORE_COMPILED_PATH="$AZ_DIR/bin/core.zsh"
export AZ_CORE_COMPILED_MIN_PATH="$AZ_DIR/bin/core.min.zsh"
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
export AZ_DEBUG=${AZ_DEBUG:-"false"}
typeset -gA nav_list
function azIsDebug() {
 if [ "$AZ_DEBUG" = "true" ]; then
 return 0
 fi
 return 1
}
function azNoDebug() {
 if azIsDebug; then
 return 1
 else
 return 0
 fi
}
alias azIsNotDebug='azNoDebug'
function azDebug() {
 if azNoDebug; then
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
function azLoadUser() {
 if [ -f "$AZ_CONFIG_DIR/include.zsh" ]; then
 source "$AZ_CONFIG_DIR/include.zsh"
 fi
}
export PATH="$AZ_CONFIG_DIR/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
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
azLoadUser
function listen_hotkey() {
 echo "Press a hotkey sequence (e.g., '^y^b'): "
 read -r input_hotkey
}
bindkey -s '^h^k' 'listen_hotkey^M'
bindkey -s '^N' 'echo Hello^M'
function command_not_found_handler {
 azFindCommand "$@"
 if [ $? -eq 0 ]; then
 return 0
 fi
 azError "[command_not_found_handler.zsh] Command '${AZ_C_YELLOW}$1${AZ_C_RESET}'${2:+ (arguments ${AZ_C_YELLOW}${@:2}${AZ_C_RESET})} not found. Did you mean to run a different command?"
 return 127
}
autoload -Uz compinit
compinit
compdef _az az
__az_debug()
{
 local file="$BASH_COMP_DEBUG_FILE"
 if [[ -n ${file} ]]; then
 echo "$*" >> "${file}"
 fi
}
_az()
{
 local shellCompDirectiveError=1
 local shellCompDirectiveNoSpace=2
 local shellCompDirectiveNoFileComp=4
 local shellCompDirectiveFilterFileExt=8
 local shellCompDirectiveFilterDirs=16
 local shellCompDirectiveKeepOrder=32
 local lastParam lastChar flagPrefix requestComp out directive comp lastComp noSpace keepOrder
 local -a completions
 __az_debug "\n========= starting completion logic =========="
 __az_debug "CURRENT: ${CURRENT}, words[*]: ${words[*]}"
 # The user could have moved the cursor backwards on the command-line.
 # We need to trigger completion from the $CURRENT location, so we need
 # to truncate the command-line ($words) up to the $CURRENT location.
 # (We cannot use $CURSOR as its value does not work when a command is an alias.)
 words=("${=words[1,CURRENT]}")
 __az_debug "Truncated words[*]: ${words[*]},"
 lastParam=${words[-1]}
 lastChar=${lastParam[-1]}
 __az_debug "lastParam: ${lastParam}, lastChar: ${lastChar}"
 # For zsh, when completing a flag with an = (e.g., az -n=<TAB>)
 # completions must be prefixed with the flag
 setopt local_options BASH_REMATCH
 if [[ "${lastParam}" =~ '-.*=' ]]; then
 # We are dealing with a flag with an =
 flagPrefix="-P ${BASH_REMATCH}"
 fi
 # Prepare the command to obtain completions
 requestComp="${words[1]} __complete ${words[2,-1]}"
 if [ "${lastChar}" = "" ]; then
 # If the last parameter is complete (there is a space following it)
 # We add an extra empty parameter so we can indicate this to the go completion code.
 __az_debug "Adding extra empty parameter"
 requestComp="${requestComp} \"\""
 fi
 __az_debug "About to call: eval ${requestComp}"
 # Use eval to handle any environment variables and such
 out=$(eval ${requestComp} 2>/dev/null)
 __az_debug "completion output: ${out}"
 # Extract the directive integer following a : from the last line
 local lastLine
 while IFS='\n' read -r line; do
 lastLine=${line}
 done < <(printf "%s\n" "${out[@]}")
 __az_debug "last line: ${lastLine}"
 if [ "${lastLine[1]}" = : ]; then
 directive=${lastLine[2,-1]}
 # Remove the directive including the : and the newline
 local suffix
 (( suffix=${#lastLine}+2))
 out=${out[1,-$suffix]}
 else
 # There is no directive specified. Leave $out as is.
 __az_debug "No directive found. Setting do default"
 directive=0
 fi
 __az_debug "directive: ${directive}"
 __az_debug "completions: ${out}"
 __az_debug "flagPrefix: ${flagPrefix}"
 if [ $((directive & shellCompDirectiveError)) -ne 0 ]; then
 __az_debug "Completion received error. Ignoring completions."
 return
 fi
 local activeHelpMarker="_activeHelp_ "
 local endIndex=${#activeHelpMarker}
 local startIndex=$((${#activeHelpMarker}+1))
 local hasActiveHelp=0
 while IFS='\n' read -r comp; do
 # Check if this is an activeHelp statement (i.e., prefixed with $activeHelpMarker)
 if [ "${comp[1,$endIndex]}" = "$activeHelpMarker" ];then
 __az_debug "ActiveHelp found: $comp"
 comp="${comp[$startIndex,-1]}"
 if [ -n "$comp" ]; then
 compadd -x "${comp}"
 __az_debug "ActiveHelp will need delimiter"
 hasActiveHelp=1
 fi
 continue
 fi
 if [ -n "$comp" ]; then
 # If requested, completions are returned with a description.
 # The description is preceded by a TAB character.
 # For zsh's _describe, we need to use a : instead of a TAB.
 # We first need to escape any : as part of the completion itself.
 comp=${comp//:/\\:}
 local tab="$(printf '\t')"
 comp=${comp//$tab/:}
 __az_debug "Adding completion: ${comp}"
 completions+=${comp}
 lastComp=$comp
 fi
 done < <(printf "%s\n" "${out[@]}")
 # Add a delimiter after the activeHelp statements, but only if:
 # - there are completions following the activeHelp statements, or
 # - file completion will be performed (so there will be choices after the activeHelp)
 if [ $hasActiveHelp -eq 1 ]; then
 if [ ${#completions} -ne 0 ] || [ $((directive & shellCompDirectiveNoFileComp)) -eq 0 ]; then
 __az_debug "Adding activeHelp delimiter"
 compadd -x "--"
 hasActiveHelp=0
 fi
 fi
 if [ $((directive & shellCompDirectiveNoSpace)) -ne 0 ]; then
 __az_debug "Activating nospace."
 noSpace="-S ''"
 fi
 if [ $((directive & shellCompDirectiveKeepOrder)) -ne 0 ]; then
 __az_debug "Activating keep order."
 keepOrder="-V"
 fi
 if [ $((directive & shellCompDirectiveFilterFileExt)) -ne 0 ]; then
 # File extension filtering
 local filteringCmd
 filteringCmd='_files'
 for filter in ${completions[@]}; do
 if [ ${filter[1]} != '*' ]; then
 # zsh requires a glob pattern to do file filtering
 filter="\*.$filter"
 fi
 filteringCmd+=" -g $filter"
 done
 filteringCmd+=" ${flagPrefix}"
 __az_debug "File filtering command: $filteringCmd"
 _arguments '*:filename:'"$filteringCmd"
 elif [ $((directive & shellCompDirectiveFilterDirs)) -ne 0 ]; then
 # File completion for directories only
 local subdir
 subdir="${completions[1]}"
 if [ -n "$subdir" ]; then
 __az_debug "Listing directories in $subdir"
 pushd "${subdir}" >/dev/null 2>&1
 else
 __az_debug "Listing directories in ."
 fi
 local result
 _arguments '*:dirname:_files -/'" ${flagPrefix}"
 result=$?
 if [ -n "$subdir" ]; then
 popd >/dev/null 2>&1
 fi
 return $result
 else
 __az_debug "Calling _describe"
 if eval _describe $keepOrder "completions" completions $flagPrefix $noSpace; then
 __az_debug "_describe found some completions"
 # Return the success of having called _describe
 return 0
 else
 __az_debug "_describe did not find completions."
 __az_debug "Checking if we should do file completion."
 if [ $((directive & shellCompDirectiveNoFileComp)) -ne 0 ]; then
 __az_debug "deactivating file completion"
 # We must return an error code here to let zsh know that there were no
 # completions found by _describe; this is what will trigger other
 # matching algorithms to attempt to find completions.
 # For example zsh can match letters in the middle of words.
 return 1
 else
 # Perform file completion
 __az_debug "Activating file completion"
 # We must return the result of this command, so it must be the
 # last command, or else we must store its result to return it.
 _arguments '*:filename:_files'" ${flagPrefix}"
 fi
 fi
 fi
}
if [ "$funcstack[1]" = "_az" ]; then
 _az
fi
function _nav {
 local -a nav_suggestions=()
 for key in "${(k)nav_list[@]}"; do
 echo "Add suggestion: $key"
 nav_suggestions+=($key)
 done
 compadd -- ${nav_suggestions}
}
compdef _nav az nav
if [ ! -f "$AZ_CONFIG_FILE" ]; then
 az cli config/initialise
fi
export AZ_DEBUG=$(jq -r .debug "$AZ_CONFIG_FILE")
alias rs="az restart"
alias l="az load"
alias rl="az reload"
alias rr="az restart"
alias up="az up"
alias clr="clear"
alias c="clear"
alias dir='ls'
alias he="az hard-exit"
