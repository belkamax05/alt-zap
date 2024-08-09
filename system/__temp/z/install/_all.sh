# echo "All here"
# all-install() {
#   install-package() {
#     local pkg=$1
#     local install_cmd=$2

#     if pkg-missing "$pkg"; then
#       echo-info "Installing $pkg..."
#       if $install_cmd; then
#         echo-success "$pkg installed successfully."
#       else
#         echo-error "Failed to install $pkg."
#         exit 1
#       fi
#     else
#       echo-info "$pkg is already installed."
#     fi
#   }

#   # install-package "nvm" install-nvm
#   # install-package "fzf" install-fzf
#   # install-package "rustc" install-rust
#   # install-package "lsd" install-lsd
# }
packages=("hello" "zgen" "jdk" "rust")

for pkg in "${packages[@]}"; do
  z install "$pkg"
done
