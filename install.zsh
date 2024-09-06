#? RUN: sh -c "$(curl -fsSL https://raw.githubusercontent.com/belkamax05/alt-zap/master/install.zsh)"
#? or redefine installation dir by setting AZ_INSTALL_DIR variable
#? RUN: AZ_INSTALL_DIR="$HOME/dev/alt-zap" sh -c "$(curl -fsSL https://raw.githubusercontent.com/belkamax05/alt-zap/master/install.zsh)"

export AZ_INSTALL_DIR=${AZ_INSTALL_DIR:-"$HOME/dev/alt-zap"}
echo "⌥⎇ sh  Cloing alt-zap into $AZ_INSTALL_DIR"
git clone git@github.com:belkamax05/alt-zap.git $AZ_INSTALL_DIR
echo "⌥⎇ sh  Adding alt-zap to your .zshrc file"
echo "source $AZ_INSTALL_DIR/include.zsh" >> $HOME/.zshrc
