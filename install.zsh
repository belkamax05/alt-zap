#? RUN: sh -c "$(curl -fsSL https://raw.githubusercontent.com/belkamax05/alt-zap/master/install.zsh)"

echo "Installing alt-zap..."
export AZ_DIR2=$(dirname "${(%):-%N}")
echo "Dir running at: $AZ_DIR2"