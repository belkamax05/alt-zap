export AZ_CONFIG_DIR="${AZ_CONFIG_DIR:-$HOME/.az}"
export AZ_CONFIG_FILE="$AZ_CONFIG_DIR/user-config.json"
export AZ_SYSTEM_DIR="$AZ_DIR/system"
export AZ_SYSTEM_PLUGINS_DIR="$AZ_DIR/system/plugins"
export AZ_SYSTEM_COMMANDS_DIR="$AZ_SYSTEM_DIR/commands"
export NVM_DIR=${NVM_DIR:-"$AZ_CONFIG_DIR/bin/.nvm"}
export AZ_SYSTEM_PLUGIN_DIR="$AZ_DIR/system/plugins"
export AZ_CORE_COMPILED_PATH="$AZ_DIR/bin/core.zsh"
export AZ_CORE_COMPILED_MIN_PATH="$AZ_DIR/bin/core.min.zsh"
export PATH="$AZ_CONFIG_DIR/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export AZ_C_CYAN="\033[38;5;51m" #00FFFF
export AZ_C_DARK_RED="\033[38;5;196m" #FF3131
export AZ_C_YELLOW="\033[38;5;226m" #FFFF00
export AZ_C_HOTPINK="\033[38;5;199m" #FF00AF
export AZ_C_GREEN="\033[38;5;46m" #00FF00
export AZ_C_MAGENTA="\033[38;2;201;101;201m" #C965C9
export AZ_C_WHITE="\033[38;5;231m" #FFFFFF
export AZ_C_DARK_BLUE="\033[38;5;21m" #0000FF
export AZ_C_DARK_GREEN="\033[38;5;22m" #00FF00
export AZ_C_DARK_YELLOW="\033[38;5;58m" #FFFF00
export AZ_C_DARK_CYAN="\033[38;5;37m" #00FFFF
export AZ_C_DARK_MAGENTA="\033[38;5;90m" #FF00FF
export AZ_C_DARK_WHITE="\033[38;5;255m" #FFFFFF
export AZ_C_DARK_GRAY="\033[38;5;240m" #808080
export AZ_C_DARK_ORANGE="\033[38;5;208m" #FFA500
export AZ_C_DARK_PINK="\033[38;5;198m" #FF69B4
export AZ_C_DARK_PURPLE="\033[38;5;57m" #800080
export AZ_C_DARK_TURQUOISE="\033[38;5;44m" #40E0D0
export AZ_C_RESET="\033[0m"
export AZ_C_BOLD="\033[1m"
export AZ_C_ERROR="$AZ_C_DARK_RED"
export AZ_C_DEBUG="$AZ_C_MAGENTA"
export AZ_PREFFIX="⌥⎇ sh "
export AZ_PREFFIX_ECHO="${AZ_C_CYAN}$AZ_PREFFIX${AZ_C_RESET} 💬"
export AZ_PREFFIX_ERROR="${AZ_C_ERROR}$AZ_PREFFIX${AZ_C_RESET} ❌"
export AZ_PREFFIX_SUCCESS="${AZ_C_CYAN}$AZ_PREFFIX${AZ_C_RESET} ✅"
export AZ_PREFFIX_INFO="${AZ_C_CYAN}$AZ_PREFFIX${AZ_C_RESET} ℹ️"
export AZ_PREFFIX_DEBUG="${AZ_C_DEBUG}$AZ_PREFFIX${AZ_C_RESET} 🚧"
AZ_DEBUG="false"
typeset -gA nav_list
alias he="az hard-exit"
alias nav="az nav"
alias here="az here"
alias cli="az cli"
alias restart="az restart"
alias load="az load"
alias reload="az reload"
alias up="nav .."
alias rs="restart"
alias l="load"
alias rl="reload"
alias rr="restart"
alias clr="clear"
alias c="clear"
alias dir='ls'
function azTraceGuard() {
 azTrace "${AZ_C_CYAN}[Guard]${AZ_C_RESET} $@"
}
function azTraceSource() {
 azTrace "${AZ_C_CYAN}[Source]${AZ_C_RESET} $@"
}
function azTraceFunction() {
 local name="$1"
 azTrace "${AZ_C_CYAN}[$name]${AZ_C_RESET} $@"
}
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
function azDebugSource() {
 azDebug "${AZ_C_CYAN}[Source]${AZ_C_RESET} $@"
}
function azDebugFunction() {
 local name="$1"
 # if [ "$name" = "azRunCommand" ]; then
 # return 0
 # elif [ "$name" = "azFindCommand" ]; then
 # return 0
 # fi
 azDebug "${AZ_C_CYAN}[$name]${AZ_C_RESET} ${@:2}"
}
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
function azErrorFunction() {
 local name="$1"
 azError "${AZ_C_CYAN}[$name]${AZ_C_RESET} ${@:2}"
}
function azGuardSet() {
 local name="$1"
 azTraceGuard "Guard set: '${AZ_C_YELLOW}$name${AZ_C_RESET}'"
 AZ_GUARD="AZ_GUARD_${name//-/_}_ZSH"
 eval "$AZ_GUARD=1"
}
function azGuardUnset() {
 local name="$1"
 azTraceGuard "Guard unset: '${AZ_C_YELLOW}$name${AZ_C_RESET}'"
 AZ_GUARD="AZ_GUARD_${name//-/_}_ZSH"
 eval "$AZ_GUARD=0"
}
function azGuardCheck() {
 local name="$1"
 AZ_GUARD="AZ_GUARD_${name//-/_}_ZSH"
 print -v AZ_GUARD_VALUE -- "${(P)AZ_GUARD}"
 if [ "$AZ_GUARD_VALUE" -eq 1 ]; then
 return 1
 fi
 return 0
}
function azSource() {
 local file="$1"
 azTraceSource "$file"
 source "$file"
}
function azSourceOnce() {
 local file="$1"
 local hash=$(echo -n "$file" | shasum -a 256 | awk '{print $1}')
 local guardName="source_once_${hash}"
 azGuardCheck "$guardName"
 if [ $? -eq 1 ]; then
 return 0
 fi
 azSource "$1"
 azGuardSet "$guardName"
}
function azSourceSystem() {
 local file="$AZ_SYSTEM_DIR/$1"
 azSource "$file"
}
function azSourceSystemLab() {
 local file="$AZ_SYSTEM_DIR/lab/$1"
 azSource "$file"
}
function azSourceSystemModule() {
 local file="$AZ_SYSTEM_COMMANDS_DIR/$1"
 azSource "$file"
}
function azSourceSystemPlugin() {
 local file="$AZ_SYSTEM_PLUGIN_DIR/$1"
 azSource "$file"
}
function azGuardSetCommand() {
 azGuardSet "command_$1"
}
function azGuardCheckCommand() {
 azGuardCheck "command_$1"
}
function azLoadCommand() {
 local command="$1"
 azGuardCheckCommand "$command"
 if [ $? -eq 1 ]; then
 return 0
 fi
 if [ -f "$AZ_SYSTEM_COMMANDS_DIR/az-$command.zsh" ]; then
 azDebugFunction "azLoadCommand" "Initialising '${AZ_C_YELLOW}$command${AZ_C_RESET}' comand"
 azSource "$AZ_SYSTEM_COMMANDS_DIR/az-$command.zsh"
 azGuardSetCommand "$command"
 return 0
 fi
 azDebugFunction "azLoadCommand" "Command '${AZ_C_YELLOW}$command${AZ_C_RESET}' not found"
 return 1
}
function azRunCommand() {
 local command="$1"
 azGuardCheckCommand "$command"
 if [ $? -eq 0 ]; then
 azLoadCommand "$command"
 fi
 azDebugFunction "azRunCommand" "Run command '${AZ_C_YELLOW}$command${AZ_C_RESET}' with args ${AZ_C_YELLOW}${@:2}${AZ_C_RESET}"
 az-$command "${@:2}"
 return 0
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
function azConfigInit() {
 if [ ! -f "$AZ_CONFIG_FILE" ]; then
 az cli config/initialise
 fi
}
function azLoadUser() {
 if [ ! -f "$AZ_CONFIG_DIR/include.zsh" ]; then
 touch "$AZ_CONFIG_DIR/include.zsh"
 fi
 source "$AZ_CONFIG_DIR/include.zsh"
}
function azLoadUserConfig() {
 AZ_DEBUG=$(jq -r .debug "$AZ_CONFIG_FILE")
}
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
function az() {
 if [ -z "$1" ]; then
 echo "!az! Default view TODO replace"
 return
 fi
 local command="$1"
 azGuardCheckCommand "$command"
 if [ $? -eq 1 ]; then
 azDebugFunction "az" "Runs '${AZ_C_YELLOW}$command${AZ_C_RESET}' from cache"
 azRunCommand "$@"
 return 0
 fi
 az-not-found "$@"
 if [ $? -eq 0 ]; then
 return 0
 fi
 # azFindCommand "$@"
 # if [ $? -eq 0 ]; then
 # return 0
 # fi
 # azError "[az.zsh] Module '${AZ_C_YELLOW}$1${AZ_C_RESET}'${2:+ (arguments ${AZ_C_YELLOW}${@:2}${AZ_C_RESET})} could not be loaded. Does not exist or error prevents loading."
 return 1
}
function az-not-found() {
 local command="$1"
 azDebugFunction "az-not-found" "Not found '${AZ_C_YELLOW}$command${AZ_C_RESET}'"
 # azDebugFunction "az-not-found" "Execute ${AZ_C_YELLOW}$@${AZ_C_RESET}"
 # echo "This is default command not found with params $@"
 if [ -f "$AZ_SYSTEM_COMMANDS_DIR/az-$command.zsh" ]; then
 azDebugFunction "az-not-found" "Run command '${AZ_C_YELLOW}$command${AZ_C_RESET}'"
 azRunCommand "$command" "${@:2}"
 return 0
 fi
 local filePath="$PWD/$command"
 if [ -f "$filePath" ]; then
 azDebugFunction "az-not-found" "Include run file $filePath"
 azRunFile "$filePath" "${@:2}"
 return 0
 fi
 azDebugFunction "az-not-found" "Redirect ${AZ_C_CYAN}not-found${AZ_C_RESET} '${AZ_C_YELLOW}$1${AZ_C_RESET}' into az-cli ${AZ_C_YELLOW}${@:2}${AZ_C_RESET}"
 az-cli "$@"
 return 0
}
azGuardSetCommand "not-found"
function az-here() {
 # echo "This is here2 with params $@"
 cd "$AZ_DIR"
}
azGuardSetCommand "here"
function az-nav() {
 local cmd=""
 local code_flag=0
 for arg in "$@"; do
 if [ "$arg" = "-c" ]; then
 code_flag=1
 elif [ -z "$cmd" ]; then
 cmd="$arg"
 fi
 done
 # echo "Nav s1 cmd=$cmd, code_flag=$code_flag"
 if [ -z "$cmd" ]; then
 azDebug "l14: No command provided"
 if ((code_flag)); then
 code -r .
 fi
 return
 fi
 #? Filtering system commands
 # echo "Nav s2 cmd=$cmd, code_flag=$code_flag"
 if [ "$cmd" = "list" ]; then
 az nav-list "$@"
 return 0
 fi
 #? Processing
 local dir="${nav_list[$cmd]}"
 if [ -z "$dir" ]; then
 #? location in dictionary not found, applying original argument $cmd
 azDebug "l34: location in dictionary not found, applying original argument $cmd"
 dir=$cmd
 fi
 # echo "Nav s3 cmd=$cmd, dir=$dir"
 if [ -n "$dir" ]; then
 # echo "Cding dir... $dir"
 cd $dir
 # load
 local newDir=$(pwd)
 if ((code_flag)); then
 code -r .
 fi
 if ((code_flag)); then
 echo "cd $newDir\nclear" >>"$STS_DIR/next_start.sh"
 restart
 fi
 fi
}
azGuardSetCommand "nav"
function az-extend-nav() {
 # echo "azExtendNav params: $0, $1, $2, $3"
 local cmd="$1"
 local dir="$2"
 # echo "azExtendNav params: cmd=$cmd, dir=$dir"
 nav_list[$cmd]="$dir"
}
azGuardSetCommand "extend-nav"
function az-extend {
 if [ "$1" = "nav" ]; then
 shift
 az extend-nav "$@"
 else
 echo "Unknown extend command $1"
 fi
}
azGuardSetCommand "extend"
function az-cli() {
 if [ "$1" = "-b" ] || [ "$1" = "--build" ] || [ "$1" = "build" ]; then
 az build
 if [ -n "$2" ]; then
 az cli "${@:2}"
 fi
 return 0
 fi
 # Prevents command execution (> "command").
 if [ "$1" = "-n" ] || [ "$1" = "--no-run" ]; then
 az-cli "${@:2}" >/dev/null
 return 0
 fi
 # Run the node script and capture its output and exit code
 # local scriptResult=$(FORCE_COLOR=1 node "$AZ_DIR/dist/apps/cli/index.cjs" "$@" | tee /dev/tty)
 local scriptResult=$(FORCE_COLOR=1 "$AZ_DIR/bin/run" "$@" | tee /dev/tty)
 local scriptCode=$?
 while IFS= read -r line; do
 if [[ "${line}" == "> "* ]]; then
 echo "Executing: ${line:2}. TODO (not to use this feature)"
 # eval "${line:2}"
 fi
 done <<<"${scriptResult}"
 # Print the captured exit code
 # echo "Process exit code: ${scriptCode}"
 # Return the captured exit code
 return ${scriptCode}
}
azGuardSetCommand "cli"
function listen_hotkey() {
 echo "Press a hotkey sequence (e.g., '^y^b'): "
 read -r input_hotkey
}
bindkey -s '^h^k' 'listen_hotkey^M'
bindkey -s '^N' 'echo Hello^M'
function command_not_found_handler {
 # azFindCommand "$@"
 # if [ $? -eq 0 ]; then
 # return 0
 # fi
 # azError "[command_not_found_handler.zsh] Command '${AZ_C_YELLOW}$1${AZ_C_RESET}'${2:+ (arguments ${AZ_C_YELLOW}${@:2}${AZ_C_RESET})} not found. Did you mean to run a different command?"
 # return 127
 local command="$1"
 azDebugFunction "command_not_found_handler" "Not found '${AZ_C_YELLOW}$command${AZ_C_RESET}'"
 if [ -f "$AZ_SYSTEM_PLUGINS_DIR/$command/install.zsh" ]; then
 azDebugFunction "command_not_found_handler" " Installing '${AZ_C_YELLOW}$command${AZ_C_RESET}'"
 az install-plugin $command
 "$@"
 return 0
 fi
 az "$@"
 return 0
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
function azCoreStart() {
 azConfigInit
 azLoadUserConfig
 azLoadUser
}
