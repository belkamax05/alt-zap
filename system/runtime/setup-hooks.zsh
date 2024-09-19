# preexec() {
#     #   if [[ -n $ZSH_HOOK_PREEXEC ]]; then
#     #     eval $ZSH_HOOK_PREEXEC
#     #   fi
#     local command="$1"
#     # echo "This is preexec $command"
#     if [[ "$command" == "cd"* ]]; then
#         echo "cd detected"
#         trap 'return 130' DEBUG
#         # prevent command execution from happening
#         # return 1
#     fi
# }
