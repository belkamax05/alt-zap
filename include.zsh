export AZ_DIR=$(dirname "${(%):-%N}")
if [ -z "${AZ_CONFIG_DIR}" ]; then
  export AZ_CONFIG_DIR="$HOME/.az"
fi
source "$AZ_DIR/system/include.zsh"
