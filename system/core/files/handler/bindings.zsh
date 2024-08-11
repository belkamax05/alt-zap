# bindkey -s '^b' 'echo Hello here^M'

# function get_bindkey_value() {
#   local hotkey="$1"
#   local bindings_file="bindings.sh"

#   # Escape special characters in hotkey for grep
#   local escaped_hotkey=$(echo "$hotkey" | sed 's/\^/\\\^/g')

#   # Search for the hotkey in the bindings file and extract the command
#   local command=$(grep "bindkey -s '$escaped_hotkey'" "$bindings_file" | sed "s/bindkey -s '$escaped_hotkey' '\(.*\)^M'/\1/")

#   if [ -z "$command" ]; then
#     echo "No command found for hotkey: $hotkey"
#   else
#     echo "Command for hotkey '$hotkey': $command"
#   fi
# }

function listen_hotkey() {
    echo "Press a hotkey sequence (e.g., '^y^b'): "
    read -r input_hotkey
}
bindkey -s '^h^k' 'listen_hotkey^M'
bindkey -s '^N' 'echo Hello^M'

# bindkey -s '^y^b^p' 'yarn build --prod^M'
# bindkey -s '^y^b^d' 'yarn build --dev^M'
# bindkey -s '^y^b' 'yarn build^M'
# bindkey -s '^y^s^p' 'yarn start --prod^M'
# bindkey -s '^y^s' 'yarn start^M'
# bindkey -s '^m' 'yarn mock^M'
