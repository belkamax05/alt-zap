export AZ_DEBUG=$(jq -r .debug ~/.az/user-config.json) # "true" or "false"

typeset -gA nav_list
